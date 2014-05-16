%function [ output_args ] = pca( daten )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

daten = data1

comps = length( daten(:,1) ) % Anzahl der Komponenten

transp = daten' % transponieren

%koordinatensystem in die "mitte" setzen

%for ind=1:length( transp(:,1) )
%  m = mean( transp( ind, : ) )
%   transp( ind, : ) = transp( ind, : ) - m  %mittelwert von der spalte abziehen...
%    
%end


coData = cov( transp ) %TODO: eigene Funktion verwenden!!!!

size( coData )

[EVectors,EValues] = eig( coData )

EValues = max( EValues, [], 2 )

plot2DPCA( data1, [ 0, 0 ], 0, EVectors, EValues, 0, 0 )



%end

