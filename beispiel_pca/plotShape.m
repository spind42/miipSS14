function plotShape( meanshape, vecs, b )

x=generateShape(vecs,meanshape,b);  %Generiert Shape%
    

plot(x(1:128),x(129:end),'b');
hold on
plot(meanshape(1:128),meanshape(129:end),'r') 




end