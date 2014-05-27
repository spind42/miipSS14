function [ EVectors,EValues ] = pca( daten )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%load( 'daten.mat' )
%load( 'demoData.mat' )
%daten = data1
%daten = data2;


%comps = length( daten(:,1) ) % Anzahl der Komponenten

%transp = daten'; % transponieren

%koordinatensystem in die "mitte" setzen
%for ind=1:length( transp(:,1) )
%  m = mean( transp( ind, : ) );
%   transp( ind, : ) = transp( ind, : ) - m;  %mittelwert von der spalte abziehen...
%    
%end


%coData = cov( transp ); %TODO: eigene Funktion verwenden!!!!
coData = ourCov( daten );

%size( coData )


evals = eig( coData );

[EVectors,EValues] = eig( coData );

%EValues = max( EValues, [], 2 );
%
%if EValues == evals
%    disp( 'is equal')
%else
%    disp( 'problem not equal')
%    EValues
%    evals
%end

[EValues,IND] = sort( evals, 'descend' );

EVectors = EVectors(:,IND);


%EVectors
%EValues


%daten

%reconstructed = daten;
%plot2DPCA( daten, mean( daten ) , reconstructed, EVectors, EValues, 0, 0 )

end

