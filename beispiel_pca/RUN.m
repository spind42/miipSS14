function RUN
close all
clear

aufgabe1;

aufgabe2;

end

% Aufgabe 1 a&b %
function aufgabe1
load('daten.mat');


D1=ourCov(data1);
D2=ourCov(data2);
D3=ourCov(data3);
D4=ourCov(data4);




plot(data1','.')
axis equal
figure
plot(data2','.')
axis equal
figure
plot(data3','.')
axis equal
figure
plot(data4','.')
axis equal


end

function aufgabe2

load('daten.mat');
load( 'demoData.mat');

data = data2;

[EVectors, EValues] = pca( data );
dummyReconstruction = data;  % here you would use your reconstructed data
dataMean = mean( data );

plot2DPCA(data, dataMean, dummyReconstruction, EVectors, EValues, 1, 1)


data = data3;


end

