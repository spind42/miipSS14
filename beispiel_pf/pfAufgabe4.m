%Aufgabe4
%Aufgabe 4.a siehe train.m, predict.m%
function pfAufgabe4
%Aufgabe 4.b/c%
clear all;
close all;
load ('handdata.mat');
aligned=aligned(:,:,31:50);                             %Laden der 20 Testbilder%
    for i=1:20;
        image=images{i};
        myOptimize(image,images,masks,aligned);            %Optimierung der Kostenfunktion bis Vektor p den Shape ideal auf das image fittet%
    end
end


%Functino für Optimierung
%
function myOptimize( image, images, masks, aligned );


    load('handdata.mat')
    M=aligned;      
    for i=1:size(M,3)           %Transformation der Matrix 'aligned' von 'Werte x (X,Y) x ntes Bild BILD' auf 
    % X Werte Y Werte x ntes Bild' -> für die PCA %
 
          s(:,i)=horzcat(M(:,1,i)',M(:,2,i)');     
          
    end
    shapes=s(:,1:30);                            %für PCA der Bilder 1...30 
    meanshape = mean(shapes,2);                          %MEANshape 
    [EVecs,EVals]=pca(shapes');                 %PCA der Bilder 1..30
    
    rf=cache( @train, images,masks );           %Training mit Bilder 1:30

    [classic,probs]=predict(rf,computeFeatures(image));             %Vorhersage der Testbilder
    probs=reshape(probs(:,1),size(image));                          %Reshape des Probabilityvektors auf die Groesse des Ausgangsbildes%
    costFunction = makeCostFunction(probs, EVecs, EVals, meanshape);  %Aufrufen der Kostenfunktion, die einen Shape mit Parametervektor p erstellt%

    %min/max-Werte der einzelnen
    %Parameter des Parametervektors p, die fuer die Optimierungsfunktion zur Shapeanpassung an das Bild dienen%
    minEVals= -3*sqrt(EVals);       
    minRotation=-((2*pi)/360)*20;   
    minScaling= 0.9;
    minTranslationx= size(probs,1)*0.4;
    minTranslationy=size(probs,2)*0.4;
    maxEVals= +3*sqrt(EVals);
    maxRotation= ((2*pi)/360)*20;   
    maxScaling= 1.2;
    maxTranslationx= size(probs,1)*0.6;
    maxTranslationy=size(probs,2)*0.6;
    minimums=[minEVals',minRotation,minScaling,minTranslationx,minTranslationy]; %MinVektor der Optimierungsfunktion%
    maximums=[maxEVals',maxRotation,maxScaling,maxTranslationx,maxTranslationy]; %MaxVektor der Optimierungsfunktion%

    optimize(costFunction,minimums',maximums',@drawPopulation);                 %Optimierung des erstellten Shapes, Uebergabe:Kostenfunktion(mit Shape),MinVektor,MaxVektor,Plot der Populations)
end



function f = makeCostFunction(probs, EVecs, EVals, meanshape)                 %Closure mit Kostenfunktion, Shapeerstellung im 1. Durchlauf, im n+1 Durchlauf erfolgt Shapefitting durch neuen Parametervektor p%
    f = @costFunction;
    function c = costFunction(params)
        b=params(1:13);                                                     %Eigenwerte mit Standardabweichungen [+/-3 sigma]
        r=params(14);                                                       %Rotation im Bereich [-20,20]
        s=params(15);                                                       %Skalierung im Bereich [90%-120%]
        x=params(16);                                                       %Translation im Bereich [40%-60%]
        y=params(17);
        shape=generateShape(EVecs,EVals,meanshape,[b',r,s,x,y]);              %Shapegenerierung%
        shape(:,1)=shape(:,1)+size(probs,1)/2;                              %Anpassung der x-Werte auf neues Koordinatensystem%
        shape(:,2)=shape(:,2)+size(probs,2)/2;                              %Anpassung der y-Werte auf neues Koordinatensystem%

        if not(all(shape(:,1)<0) & all(shape(:,1)>size(probs,1)) & all(shape(:,2)>size(probs,2)) & all(shape(:,2)<0))  %Filtern der Pixel, die ausserhalb des Koordinatensystems liegen, bzw. negative Werte besitzen%         
            c=inf;                                                                                                     %'Falsche' Pixel werden mit 'inf' 'bestraft'%
        else
            indices = sub2ind(size(probs),shape(:,1),shape(:,2));                                                      %Indices der Probs mit Maske:Shape%

            pbID=probs(indices);

            c = mean(pbID)                                                                                             %Kostenwert%
        end
    end
end

function h = drawPopulation(population, bestInd)                            %Plotten der Populations%                        
    h(1) = plot(population(1,:),population(2,:),'wx'); hold on              
    h(2) = plot(population(1,:),population(2,:),'b+'); hold on
    h(3) = plot(population(1,bestInd),population(2,bestInd),'g+');
end

