%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% Aufgabe 3 %
function Aufgabe3

clear all

load( 'daten3d.mat')

[EVec, EVals] = pca( data' );

meanvec = mean(data,2);
X = bsxfun( @minus, data, meanvec ); %zeilen mittelwert abziehen 


% Aufgabe 3a - Projektion auf den Hauptvektor %
 
P = ( EVec(:,1)'*X);
Rec = bsxfun( @plus, (EVec(:,1)*P) , meanvec); % Rekonstruktion
plot2DPCA( data', meanvec, Rec', EVec, EVals, 0, 1 );

%Aufgabe 3b - Projektion auf den Nebenvektor
P = ( EVec(:,2)'*X);
Rec = bsxfun( @plus, (EVec(:,2)*P), meanvec); % Rekonstruktion 
plot2DPCA( data', meanvec, Rec', EVec, EVals, 0, 1 );

end