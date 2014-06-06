% ad Aufgabe 5b
function plotShape( meanshape, EVecs, b )

x=generateShape(meanshape, EVecs, b);  %Generiert Shape%
    

plot(x(1:128),x(129:end),'b'); % shape in blau
hold on
plot(meanshape(1:128),meanshape(129:end),'r')  %mean shape in rot




end