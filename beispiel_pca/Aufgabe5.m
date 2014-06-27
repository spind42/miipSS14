%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% Aufgabe 5%
function Aufgabe5
load ('shapes.mat');


% Aufgabe 5 a
for i=1:size(aligned,3)
 
          shapes(:,i)=horzcat(aligned(:,1,i)',aligned(:,2,i)'); 
          
end


%Aufgabe 5.b%
meanshape = mean(shapes,2); %meanshape%

mats=bsxfun(@minus,shapes,meanshape)    %Meanmatrix%

[EVec,EVal]=pca(shapes');



hv = i;    %Hauptvektoren

tvec = EVec(:,1:hv);    % temp variable
tval = EVal(1:hv);

i = 1;
for i = 1:hv
    figure;
    for s = linspace(-3*sqrt(tval(i)),3*sqrt(tval(i)), 10 ), % | +- 3 Lambda bzw. Standardabweichung | % 
        b = zeros(1,hv); %alles auf null 
        b(i) = s; %bis auf eines auf standardabweichung
        plotShape(meanshape, tvec, b);
        axis equal;
        hold on
    end
    hold on
    title(['Shape nummer: ' num2str(i)]);
end





%Aufgabe 5c
figure;

%Berechnung benötigter hauptkomponenten
csum = cumsum( tval )
csum = csum / sum( tval ) %prozentzahlen 

%Gesamtvarianz 100%
%alle Komponenten: 100%
b = randn(1,hv).*sqrt( tval(1) );
plotShape( meanshape, tvec( : , 1:hv ), b );
axis equal
%title('100% Varianz')
hold on

%Gesamtvarianz 95%
% 5 Komponenten: 96.33%
b = randn(1,5).*sqrt( tval(5) )
plotShape( meanshape, tvec(:,1:5), b );
axis equal
%title('95% Varianz')
hold on

%Gesamtvarianz 90%
% 3 Komponenten notwendig: 90.58%
b = randn(1,3).*sqrt( tval( 3 ) ) 
plotShape( meanshape, tvec(:,1:3), b );
axis equal
%title('95% Varianz')
hold on

%Gesamtvarianz 80%
% 3 Komponenten notwendig: 90.58% (2 wären 0.7928)
b = randn(1,3).*sqrt( tval(3) )
plotShape( meanshape, tvec(:,1:3), b );
axis equal
%title('95% Varianz')




end







