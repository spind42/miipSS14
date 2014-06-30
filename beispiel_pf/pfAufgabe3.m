%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
%
% Aufgabe 3
function pfAufgabe3

clear all;
load ('handdata.mat');

% 3a
rf=train(images,masks);                        

% 3b
figure;
plot(oobError(rf));                                  

% 3c
figure;
plot(rf.OOBPermutedVarDeltaError);                




end