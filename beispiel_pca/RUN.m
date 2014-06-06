function RUN
close all
clear
Aufgabe1;
Aufgabe2;
Aufgabe3;
Aufgabe4;
Aufgabe5;
end

% Aufgabe 1 a&b %
function Aufgabe1
load('daten.mat');
D1=ourCov(data1);
D2=ourCov(data2);
D3=ourCov(data3);
D4=ourCov(data4);


plot(data1(1,:), data1(2,:), '.')
axis equal
figure
plot(data2(1,:), data2(2,:), '.')
axis equal
figure
plot(data3(1,:), data3(2,:), '.')
axis equal
figure
plot(data4(1,:), data4(2,:), '.')
axis equal
end


