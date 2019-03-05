function [newPop] = mut(Oldpop,factor,Space,maze)

[mazeRows,mazeCols]=size(maze);

[lpop,lstring]=size(Oldpop);

if factor>1 
    factor=1;
end

if factor<0
    factor=0;
end

n=ceil(lpop*lstring*factor*rand);

newPop=Oldpop;

for i=1:n
    r=ceil(rand*lpop);        %nahodny jedinec
    s=ceil(rand*lstring);      %nahodny prvok jedinca
   
    newPop(r,:);
    
    while(s <= 2)
    
     r=ceil(rand*lpop);        %nahodny jedinec
    s=ceil(rand*lstring);      %nahodny prvok jedinca
    end
    ss = mod(s,2);
    
    
    if(ss == 1) %ak som nasiel riadok a nemusim menit startovaciu poziciu
       toChange = newPop(r,s+1); %cislo ktore je kandidatom na mutaciu
       toChangeindx = s+1; % jeho index
       possible = true;
       while (toChange == newPop(r,toChangeindx)) %kontrola ci musim menit suradnice az po start, ak ano nespravim nic
             if(toChangeindx <=2)
               possible = false;
               break
             end
               toChangeindx = toChangeindx-2;
       end
    
       
       if(possible == true)
         % menenie NASLEDUJUCICH priamo suvisiacich suradnic 
        toChangeindx = s+1 ; 
        d=Space(2,1)-Space(1,1);
        toMe=ceil(rand*d+Space(1,1));
        
       while (toChange == newPop(r,toChangeindx)) 
            newPop(r,toChangeindx) = newPop(r,toChangeindx)+toMe;   %samotna mutacia            
            
            if(newPop(r,toChangeindx) > mazeCols) newPop(r,toChangeindx) = mazeCols; end
            if(newPop(r,toChangeindx) < 1) newPop(r,toChangeindx) = 1; end
            
            
            if(toChangeindx +2 <= lstring) %kontrola ci niesom na konci a posun
            toChangeindx = toChangeindx+2;
             else
                 break
            end
       end
       
       
       % menenie PREDCHADZAJUCICH priamo suvisiacich suradnic 
       toChangeindx = s-1; 
       while (toChange == newPop(r,toChangeindx)) 
             newPop(r,toChangeindx) = newPop(r,toChangeindx)+toMe;    %samotne krizenie    
             
            if(newPop(r,toChangeindx) > mazeCols) newPop(r,toChangeindx) = mazeCols; end
            if(newPop(r,toChangeindx) < 1) newPop(r,toChangeindx) = 1; end
             
            if(toChangeindx -2 >= 2) %kontrola ci niesom na konci a posun
            toChangeindx = toChangeindx-2;
             else
                 break
            end
       end
        
       end
           
          
    else if(ss == 0 )
            
       toChange = newPop(r,s-1); %cislo ktore je kandidatom na mutaciu     
       toChangeindx = s-1; % jeho index
       possible = true;
       while (toChange == newPop(r,toChangeindx)) %kontrola ci musim menit suradnice az po start, ak ano nespravim nic
             if(toChangeindx <=2)
               possible = false;
               break
             end
               toChangeindx = toChangeindx-2;
       end
    
       
       if(possible == true)
           
        toChangeindx = s-1 ; 
        d=Space(2,1)-Space(1,1);
        toMe=ceil(rand*d+Space(1,1));
        
       while (toChange == newPop(r,toChangeindx)) 
            newPop(r,toChangeindx) = newPop(r,toChangeindx)+toMe;   %samotna mutacia            
            
            if(newPop(r,toChangeindx) > mazeRows) newPop(r,toChangeindx) = mazeRows; end
            if(newPop(r,toChangeindx) < 1) newPop(r,toChangeindx) = 1; end
            
            
            if(toChangeindx +2 <= lstring) %kontrola ci niesom na konci a posun
            toChangeindx = toChangeindx+2;
             else
                 break
            end
       end
          
       
         toChangeindx = s-3 ; 
       while (toChange == newPop(r,toChangeindx)) 
            newPop(r,toChangeindx) = newPop(r,toChangeindx)+toMe;   %samotna mutacia            
            
            if(newPop(r,toChangeindx) > mazeRows) newPop(r,toChangeindx) = mazeRows; end
            if(newPop(r,toChangeindx) < 1) newPop(r,toChangeindx) = 1; end
            
            
            if(toChangeindx -2 > 2) %kontrola ci niesom na konci a posun
            toChangeindx = toChangeindx-2;
             else
                 break
            end
       end
       
       end 
      
        end
        
    end
    end
end    
    
   
  

