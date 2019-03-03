function [Distance] = Distance(endPointOfMaze, endPointOfPath)

a = endPointOfMaze(1)-endPointOfPath(1);
b = endPointOfMaze(2)-endPointOfPath(2);

Distance = sqrt(power(a,2)+power(b,2));

end    



