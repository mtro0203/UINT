% 1 volno
% 0 prekazka


a = [3,1];
load('bludisko2');
pop = genrPop(10,10,40,a);
fit = Fitness(b,pop);
[minFit,indx] = min(fit);

minRet = pop(indx,:);
b=track(b,minRet);

n=size(b,1);
image(b+1);colormap(hsv(5));
set(gca,'xtick',[1:1:n]);
set(gca,'ytick',[1:1:n]);