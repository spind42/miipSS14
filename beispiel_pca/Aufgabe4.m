
% Aufgabe 4 %
% Untersuchungen in 3D
function Aufgabe4

load( 'daten3d.mat')

close all

[EVec,EVal] = pca( data' );

meanvec = mean(data,2);
X = bsxfun( @minus, data, meanvec ); %zeilen mittelwert abziehen 


% 4a %
plot3DPCA( data', meanvec', EVec, EVal, 1, 0 );


% 4b %

%x = EVec( :,2 )

P = ( EVec(:,1:2)'*X );
Rec=bsxfun( @plus,(EVec(:,1:2)*P), meanvec ); 

%mit Rekonstruktion
plot3DPCA( data', meanvec', EVec, EVal, 1, 1  );


end