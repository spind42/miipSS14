%
%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% Aufgabe1
%
function pfAufgabe1()

    clear all;
    close all;
    load ('handdata.mat')
     

    M=aligned;      
    for i=1:size(M,3)           %Transformation der Matrix 'aligned' von 'Werte x (X,Y) x ntes Bild BILD' auf 
    % X Werte Y Werte x ntes Bild' -> für die PCA %
 
          s(:,i)=horzcat(M(:,1,i)',M(:,2,i)');     
          
    end

    shapes=s(:,31:50);                            %nur die Trainingsdaten... 
    

    meanshape = mean(shapes,2);                          %MEANshape 

    [EVecs,EVals]=pca(shapes');                             
    %EVecs = EVecs(:,1:13);       %nur die ersten 13 Komponenten                          
    %EVals = EVals(1:13);                                   
    b=sqrt(EVals)';

    
%plotten sie mehrere shapes mit verschiedenen parametern....    
    
    p2 = [ 0, 2, 0, 0 ]'; %rotation: 0, skalierung: 2, trans x: 0, trans y: 0
    p = vertcat( b, p2 ); 
    
    sh1 = generateShape( meanshape, EVecs, p );
    
    plotShape( meanshape, sh1 );
    
    
    p2 = [ 0, 2, 4, 0 ]'; %rotation: 0, skalierung: 2, trans x: 4, trans y: 0
    p = vertcat( b, p2 ); 
    
    sh1 = generateShape( meanshape, EVecs, p );
    
    plotShape( meanshape, sh1 );
    
    
    p2 = [ 90, 2, 0, 0 ]'; %rotation: 90, skalierung: 2, trans x: 0, trans y: 0
    p = vertcat( b, p2 ); 
    
    sh1 = generateShape( meanshape, EVecs, p );
    
    plotShape( meanshape, sh1 );
    
        p2 = [ 0, 0.5, 0, 100 ]'; %rotation: 0, skalierung: 0.5, trans x: 0, trans y: 10
    p = vertcat( b, p2 ); 
    
    sh1 = generateShape( meanshape, EVecs, p );
    
    plotShape( meanshape, sh1 );

end