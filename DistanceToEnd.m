function [Distance] = DistanceToEnd(endPointOfMaze, endPointOfPath)  %vypocet vzdialenosti od koncoveho bodu

a = endPointOfMaze(1)-endPointOfPath(1);
b = endPointOfMaze(2)-endPointOfPath(2);

Distance = 180*sqrt(power(a,2)+power(b,2));

end    



