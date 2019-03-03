% 1 volno
% 0 prekazka

startPoint = [3,1];
endPointOfMaze = [15,13];
load('bludisko2');
pop = genrPop(10,5,40,startPoint);


fit = Fitness(b,pop,endPointOfMaze);



[minFit,indx] = min(fit);
minRet = pop(indx,:)
b=track(b,minRet);

n=size(b,1);
image(b+1);colormap(hsv(5));
set(gca,'xtick',[1:1:n]);
set(gca,'ytick',[1:1:n]);