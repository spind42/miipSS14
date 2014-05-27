load('daten.mat');

data = data1;

[EVectors, EValues] = pca( data );
dummyReconstruction = data;  % here you would use your reconstructed data
dataMean = mean( data );
plot2DPCA(data, dataMean, dummyReconstruction, EVectors, EValues, 1, 1)

size ( data )
size( dataMean )
size( EVectors )
size( EValues )
