function RUN
close all
clear
a;
end

% Aufgabe 1 a&b %
function a
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

