%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% x...2 shape
%
% ad Aufgabe 5b
function plotShape( meanshape, x )   

%x=generateShape(meanshape, EVecs, b);  %Generiert Shape%
    

plot(x(1:64),x(65:end),'b'); % shape in blau
hold on
plot(meanshape(1:64),meanshape(65:end),'r')  %mean shape in rot




end