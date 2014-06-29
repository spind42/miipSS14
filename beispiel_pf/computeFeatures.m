%
%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% Aufgabe 2 - computeFeatures function
% führt die Feature Berechnung für einen Pixel im Bild durch
%
function [features] = computeFeatures( image )

%Grauwert des Pixels 
grauwert = image(:);

%Gradient in x-Richtung
%Gradient in y-Richtung
[gradX, gradY] = gradient( single( image ) );

gradX=gradX(:); %umwandeln von matrix in zeile
gradY=gradY(:);

%Haar-Like Features
haarlike=cache( @computeHaarLike, image );
haarlike=haarlike';

%x Koordinate
[ysize, xsize] = size( image );

[X,Y]=meshgrid(1:xsize,1:ysize);  
X = X(:);
Y= Y(:);

%y Koordinate


%size( gradX )
%size( gradY )
%size( grauwert )
%size( X )
%size( Y )
%size( haarlike )

features = [ int64(gradX), gradY, grauwert, X, Y, haarlike ]; %grauwertFeature, GradX, GradY, X-, Y-Koordinate, HaarlikeFeatures


end