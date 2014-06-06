% Aufgabe 5%
function Aufgabe5
load ('shapes.mat');


% Aufgabe 5 a
for i=1:size(aligned,3)
 
          shapes(:,i)=horzcat(aligned(:,1,i)',aligned(:,2,i)'); 
          
end


%Aufgabe 5.b%
meanshape = mean(shapes,2); %meanshape%

mats=bsxfun(@minus,shapes,meanshape)    %Meanmatrix%

[EVec,EVal]=pca(shapes);



hv = length(EVec(:,1));    %Hauptvektoren


vecs = EVec(:,1:14);    % imagesc(vecs); figure(gcf) => 14 Hauptvektoren%
vals = EVal(1:14);

for i = 1:hv
    figure;
    for s = linspace(-3*sqrt(vals(i)),3*sqrt(vals(i)),10), % |3x sigma| % 
        b = zeros(1,14);
        b(i) = s;
        plotShape(meanshape, vecs, b);
        axis equal;
        hold on
    end
    hold on
    title(['Shape nummer: ' num2str(i)]);
end


% Aufgabe 5.c, plot(cumsum(vals)/sum(vals)) zeigt die Eigenwertkurve%
% Gesamtvarianz 80:n=3 %
figure;


EVeca=vecs(:,1:3);
b=randn(1,3).*1.281552;     %Sigma-Bereich für 80% Varianz%
plotShape(meanshape,EVeca,b);
hold on
axis equaldaten = data1;

% Gesamtvarianz 90:n=3 %
%vecb=vecs(:,1:3);
%b=randn(1,3).*1.644854;     %Sigma-Bereich für 90% Varianz%
%plotShape(vecb,meanshape,b);
%hold on
%axis equal

% Gesamtvarianz 95:n=5 %
%vecc=vecs(:,1:5);
%b=randn(1,5).*1.959964;     %Sigma-Bereich für 95% Varianz%
%plotShape(vecc,meanshape,b);
%axis equal
%hold on

% Gesamtvarianz 100:n=13     %Sigma-Bereich für 100% Varianz%
%vecc=vecs(:,1:13);
%b=randn(1,13).*7;
%plotShape(vecc,meanshape,b);
%axis equal
%hold on
end


