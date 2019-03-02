function [fit] = Fitness(maze,pop)

crossPenalty = 5;

[lpop, lstring] = size(pop);

fit = zeros(1,lpop);

for i = 1:lpop
    
    x = pop(i,:);
    
  fit(i) = Penalty(maze,x,crossPenalty);
     
    
end


end

