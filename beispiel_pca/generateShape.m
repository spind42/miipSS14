%
% 1028660 Seyed Ehsan Hosseini
% 0828742 Stephann Spindler
% DIE GROSSE RUN FUNCTION %
%
% geforderte Funktion von 
%ad Aufgabe 5a
function [shape] = generateShape( meanshape, EVecs, b )

    shape=meanshape + EVecs*b';

end