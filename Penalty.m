function [penalty] = Penalty(maze,Track,crossPen,endPointOfMaze)

[a,ltrack] = size(Track);
penalty = 1;
current = 3;

endPointOfPath(1) = Track(ltrack-1);
endPointOfPath(2) = Track(ltrack);


if(maze(Track(1),Track(2))==0)
    penalty = penalty + crossPen;
end

while(current <= ltrack)
    if(Track(current+1)==Track(current-1))
        if(Track(current -2) < Track(current))
            start = Track(current -2);
            ending =Track(current);
        else
             ending= Track(current -2);
             start = Track(current);   
        end
        for row = start : ending
            penalty = penalty+1;
            if(maze(row,Track(current+1)) == 0 )
              penalty = penalty + crossPen;
            end
        end
    else   
        if(Track(current-1) < Track(current+1))        
            start = Track(current-1);
            ending =Track(current+1);
        else
             ending = Track(current-1);
             start = Track(current+1);
        end   
        for col = start : ending
        penalty = penalty+1;
            if(maze(Track(current),col) == 0)
               penalty = penalty + crossPen;               
            end
        end 
    end              
    current = current + 2; 
end
penalty = penalty + Distance(endPointOfMaze,endPointOfPath) - (ltrack/2)+1;

end
