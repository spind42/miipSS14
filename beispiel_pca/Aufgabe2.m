% Aufgabe 2 a %
function Aufgabe2

load('daten.mat');

aufgabe2_help( data1 );
aufgabe2_help( data2 );
aufgabe2_help( data3 );
aufgabe2_help( data4 );

end



function aufgabe2_help( daten )

[EVectors, EValues] = pca( daten );
daten = daten';
plot2DPCA( daten, mean(daten), daten, EVectors, EValues, 1, 0 );

end