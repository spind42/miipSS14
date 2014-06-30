%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
%
%
% Aufgabe2
%
%
function pfAufgabe2

clear all;
load ('handdata.mat')
img=images{1};     

%features=cache(@computeFeatures,img);

features=computeFeatures(img);


figure;
hold all;
%Plot Feature 1 Grauwerte
subplot(2,4,1);     
imagesc(reshape(features(:,3),size(img,1),size(img,2)));  
title('Grauwerte');
% Gradient X Richtung
subplot(2,4,2);     
imagesc(reshape(features(:,1),size(img,1),size(img,2)));  %Subplot ...%
title('Gradient X-Richtung');
% Gradient Y-Reichtung
subplot(2,4,3);     
imagesc(reshape(features(:,2),size(img,1),size(img,2)));
title('Gradient Y-Richtung');
% X Koordinate
subplot(2,4,4);     
imagesc(reshape(features(:,4),size(img,1),size(img,2)));
title('X-Koordinate');
% Y Koordinate
subplot(2,4,5);     
imagesc(reshape(features(:,5),size(img,1),size(img,2)));
title('Y-Koordinate');                    
% 1. haarlike Feature
subplot(2,4,6);     imagesc(reshape(features(:,6),size(img,1),size(img,2)));
title('1. Haarlike Feature');

end