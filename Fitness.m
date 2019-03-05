function [fit] = Fitness(maze,pop,endPointOfMaze)

crossPenalty = 1000;   %penalta za prejdenie cez stenu

[lpop, lstring] = size(pop);

fit = zeros(1,lpop);
for i = 1:lpop
    x = pop(i,:);
  fit(i) = Penalty(maze,x,crossPenalty,endPointOfMaze);  %priradovanie penalty jednotlivym jedincom
end

end

