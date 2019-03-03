function [newPop] = NewPopulation(oldPop,Fitness, order)
    numCycle  = 100;
    Space=[ones(1,10)*(0);ones(1,10)*40]
    for i=1:numCycle
        selectBest = selbest(oldPop,Fitness,[1,1]);
        restPop = seltourn(oldPop,Fit,8);
        restPop = crossov(restPop,4,0);
        restPop = mutx(restPop,0.1,Space);
        restPop = muta(restPop,0.1,ones(1,10)*0.1,Space);
    
    newPop= [selectBest; restPop];
    end
end
