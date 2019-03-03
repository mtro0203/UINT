function [newPop] = genrPop(popsize,genSize,mazeSize,start)


newPop = zeros(popsize,genSize*2);
for row = 1 : popsize  
    newPop(row,1) = start(1);
    newPop(row,2) = start(2);
    
    col =3;   
   while (col <= genSize*2)
       if(rand <= 0.5)
            newPop(row,col) = newPop(row,col-2);        
            newPop(row,col+1)=randi(mazeSize);  
        else
            newPop(row,col+1) = newPop(row,col-1);        
            newPop(row,col)=randi(mazeSize);
       end
        col = col+2;
   end  
   
end

end

