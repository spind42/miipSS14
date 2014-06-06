%ad Aufgabe 5a
function [shape] = generateShape( meanshape, EVecs, b )

    shape=meanshape + EVecs*b';

end