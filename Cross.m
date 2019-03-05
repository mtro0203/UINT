function [newPop] = Cross(oldPop,countOfCross)

[lpop,lstring] = size(oldPop);
tempFirst = 0;
tempSecond = 0;

while (countOfCross > 0) 
   indxPop1 = randi(lpop);  % vyber jedincov na krizenie
   indxPop2 = randi(lpop);
   
   found = false;
  
 
   
if(indxPop1 ~= indxPop2) % ak sme nevybrali toho isteho jedinca
   second = 4;
   first = 4;
       
       %krizenie podla stlpca
        while(first <= lstring)
          
           while(second <= lstring)
              
               if(oldPop(indxPop1,first) == oldPop(indxPop2,second)) % ak najdeme take ktore je mozne krizit
                   
                   tempFirst = oldPop(indxPop1,first-1); % hodnota x na krizenie  prveho jedinca
                   tempSecond = oldPop(indxPop2,second-1); % hodnota x na krizenie  druheho jedinca                   
                   found = true;
               end
               if(found == true)  % ak nejakeho najdeme uz nepokracuj
                  break
               end
               second = second+2;              
               
           end
           
            if(found == true)
                 break
            end
           first = first +2;
        end       
       
       
      
        
   
   if(found == true)
       
       firstToChng = first-3; 
       possible = true;
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
          
           if(firstToChng <=2)
               possible = false;
               break
           end
            firstToChng = firstToChng-2;             
        end
            
   
        
       
       if(possible == true)
       % menenie NASLEDUJUCICH priamo suvisiacich suradnic prveho jedinca
       firstToChng = first-1; 
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
            oldPop(indxPop1,firstToChng) = tempSecond;   %samotne krizenie                  
            if(firstToChng +2 <= lstring) %kontrola ci niesom na konci a posun
            firstToChng = firstToChng+2;
             else
                 break
            end
       end
        
         % menenie PREDCHADZAJUCICH priamo suvisiacich suradnic prveho jedinca
         firstToChng = first-3; 
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
            oldPop(indxPop1,firstToChng) = tempSecond;   %samotne krizenie                  
            if(firstToChng -2 > 2) %kontrola ci niesom na konci a posun
            firstToChng = firstToChng-2;
             else
                 break
            end
       end
                
    
       end
    
       
       
         secondToChng = second-3;
         possible = true;
         while (tempSecond == oldPop(indxPop2,secondToChng)) % menim dalsie suradnice ktore boli priamo zavisle od nasej skrizenej 
                       
             if(firstToChng <=2)
               possible = false;
               break
             end
                        
            secondToChng = secondToChng-2;           
            
         end
      
       if(possible == true)
        % menenie NASLEDUJUCICH priamo suvisiacich suradnic druheho jedinca
        secondToChng = second-1;
        while (tempSecond == oldPop(indxPop2,secondToChng)) % menim dalsie suradnice ktore boli priamo zavisle od nasej skrizenej 
                       
            oldPop(indxPop2,secondToChng) = tempFirst;    %samotne krizenie                   
            if(secondToChng +2 <= lstring)                %kontrola ci niesom na konci a posun
            secondToChng = secondToChng+2;
            else
                break
            end
        end
        
         % menenie PREDCHADZAJUCICH priamo suvisiacich suradnic druheho jedinca
          secondToChng = second-3;
         while (tempSecond == oldPop(indxPop2,secondToChng)) % menim dalsie suradnice ktore boli priamo zavisle od nasej skrizenej 
                       
            oldPop(indxPop2,secondToChng) = tempFirst;    %samotne krizenie                   
            if(secondToChng -2 > 2)                %kontrola ci niesom na konci a posun
            secondToChng = secondToChng-2;
            else
                break
            end
            
         end
        
       end
      end

       
        
  
        %krizenie podla riadka
    second = 3;
   first = 3;
   
   found = false;
   
       while(first <= lstring)
          
           while(second <= lstring)
              
               if(oldPop(indxPop1,first) == oldPop(indxPop2,second)) % ak najdeme take ktore je mozne zkrizit
                   
                   tempFirst = oldPop(indxPop1,first+1); % riadok na krizenie z prveho jedinca
                   tempSecond = oldPop(indxPop2,second+1); % riadok na krizenie z druheho jedinca
                   
                   found = true;
               end
               if(found == true)
                  break
               end
               second = second+2;
           end
            if(found == true)
                       break
            end
           first = first +2;
       end       
       
       if(found == true)
           
       firstToChng = first-1; 
       possible = true;
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
             if(firstToChng <=2)
               possible = false;
               break
             end
               firstToChng = firstToChng-2;
             
             
             
       end
           
       if(possible == true)
        % menenie NASLEDUJUCICH priamo suvisiacich suradnic PRVEHO jedinca
        firstToChng = first+1 ;
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
            oldPop(indxPop1,firstToChng) = tempSecond;   %samotne krizenie                  
            if(firstToChng +2 <= lstring) %kontrola ci niesom na konci a posun
            firstToChng = firstToChng+2;
             else
                 break
            end
       end
       
       
       % menenie PREDCHADZAJUCICH priamo suvisiacich suradnic PRVEHO jedinca
       firstToChng = first-1; 
       while (tempFirst == oldPop(indxPop1,firstToChng)) 
            oldPop(indxPop1,firstToChng) = tempSecond;   %samotne krizenie                  
            if(firstToChng -2 >= 1) %kontrola ci niesom na konci a posun
            firstToChng = firstToChng-2;
             else
                 break
            end
       end
        
       end
       
       possible = true;
       secondToChng = second-1;
        while (tempSecond == oldPop(indxPop2,secondToChng)) % menim dalsie suradnice ktore boli priamo zavisle od nasej skrizenej
                       
            if(firstToChng <=2)
               possible = false;                     
            break             
            secondToChng = secondToChng-2;         
           
        
            end
        end
       
        if(possible == true)
         % menenie NASLEDUJUCICH priamo suvisiacich suradnic DRUHEHO jedinca
       secondToChng = second+1;
       while (tempSecond == oldPop(indxPop2,secondToChng)) 
            oldPop(indxPop2,secondToChng) = tempFirst;   %samotne krizenie                  
          if(secondToChng +2 <= lstring)                %kontrola ci niesom na konci a posun
            secondToChng = secondToChng+2;
             else
                 break
          end
       end
       
        
       % menenie PREDCHADZAJUCICH priamo suvisiacich suradnic DRUHEHO jedinca
        secondToChng = second-1;
        while (tempSecond == oldPop(indxPop2,secondToChng)) % menim dalsie suradnice ktore boli priamo zavisle od nasej skrizenej
                       
            oldPop(indxPop2,secondToChng) = tempFirst;    %samotne krizenie                   
            if(secondToChng -2 >= 1)                %kontrola ci niesom na konci a posun
            secondToChng = secondToChng-2;
            else
                break
            end
        end
        
        
        end
        countOfCross = countOfCross -2;  
       end
       
              
                    
end
        

end
newPop = oldPop;
end
          