%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
%
% ad Aufgabe 3 train

function rf = train( images, masks )



border={};
hintergrund={};
for i=1:30                                                              %Counter mit i=Anzahl Trainingsbilder%
    

    fvec = computeFeatures( images{i} );       %Features für die Testbilder 1...30
    
    border{i}= fvec(masks{i}(:)>0,:);     %nehme Feature nur wenn im Vordergrund...
    
    hintergrund{i} = fvec( masks{i}(:)<=0,:); %alle hintergrund Features
    
    %hintergrund=randi( numel(images{i}),1,size(border{i},2) );      %nehme zufällige Pixel die nicht teil vom knochen sind
   
    
    selectHintergrund = randi( size( hintergrund{i}, 1 ), 1, size( border{i}, 1 )) %zufällige hintergrundpixel auswählen
    
    size( hintergrund{i} )
    
    size( selectHintergrund )
    selectHintergrund( 1, :)
    
    hintergrund{i} = hintergrund{i}( selectHintergrund(1,:), :);                      
    
end
border = cell2mat(border(:));                 %umwandeln array -> matrix 
hintergrund = cell2mat(hintergrund(:));       

labels=cat(1,ones(size(border,1),1),zeros(size(hintergrund,1),1));     %Labeling der Vorder/Hintergrundfeatures mit 1/0 zur Unterscheidung im TreeBagger%
fvec=cat(1,border,hintergrund);                                    %Featurevektor der Vorder/Hintergrundpixel aller Bilder%
rf=cache(@TreeBagger,40,single(fvec),labels,'OOBVarImp','on');              %Uebergabe des Featurevektores & der Labels an den TreeBagger, cachen der Treestruktur%



end