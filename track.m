function [maze] = track(maze,bestTrack)

[a,ltrack] = size(bestTrack);


current = 3;

maze(bestTrack(1),bestTrack(2)) = 2;

while(current <= ltrack)

    if(bestTrack(current+1)==bestTrack(current-1))
        
        
        if(bestTrack(current -2) < bestTrack(current))
        
            start = bestTrack(current -2);
            ending = bestTrack(current);
            
        else
        
             ending= bestTrack(current -2);
             start = bestTrack(current);
             
        end
        
        for row = start : ending
        
            if(maze(row,bestTrack(current+1)) == 0 || maze(row,bestTrack(current+1)) == 3 )
                maze(row,bestTrack(current+1)) = 3;
                
            else
                maze(row,bestTrack(current+1)) = 2;
            end
            
            
        end
      
    else   
        
        if(bestTrack(current-1) < bestTrack(current+1))        
            
            start = bestTrack(current-1);
            ending = bestTrack(current+1);
            
        else
             ending = bestTrack(current-1);
             start = bestTrack(current+1);
        end  
            
        for col = start : ending
        
            if(maze(bestTrack(current),col) == 0 || maze(bestTrack(current),col) == 3)
                maze(bestTrack(current),col) = 3;
                
            else
                maze(bestTrack(current),col) = 2;
            end
            
            
        end
        
    end       
        
    
    
    
    
    
    current = current + 2;
    
end

