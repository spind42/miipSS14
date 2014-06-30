%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% Aufgabe 2
function [ EVectors,EValues ] = pca( daten )

%load( 'daten3d.mat' )
%load( 'demoData.mat' )
%daten = daten;
%daten = data2;


%coData = cov( transp ); %TODO: eigene Funktion verwenden!!!!
coData = ourCov( daten );

%evals = eig( coData );

[EVectors,EValues] = eig( coData );

EValues = max( EValues );

[EValues,IND] = sort( EValues, 'descend' );

EVectors = EVectors(:,IND);


%EVectors
%EValues
%plot2DPCA( daten, mean( daten ), daten, sortedEigVec2, sortedEigVal2, 1, 0
%daten = daten'
%plot2DPCA( daten, mean( daten ) , daten, EVectors, EValues, 1, 0 )



end

