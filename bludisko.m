% 1 volno
% 0 prekazka

numcykle = 30000;
startPoint = [1,1];
endPointOfMaze = [40,40];
countSteps = 5;

load('bludisko1');

pop = genrPop(30,countSteps,40,startPoint);  %generovanie nahodnej populacie
fit = Fitness(b,pop,endPointOfMaze);         %vyhodnotenie fitness
[minFit,indx]=min(fit);                       
 minRet =pop(indx,:);
 grafFit=zeros(1,numcykle);
 
 S = [ ones(5)*-10; ones(5)*10];
for i=1:numcykle
    
    bestStrings = selbest(pop,fit,[2,2,2]);                 %najlepsie cleny
    
    toCross1 =    selbest(pop,fit,[2,2]);                 
    toCross =    seltourn(pop,fit,10);
    new =  genrPop(10,countSteps,40,startPoint);
    other = [toCross1;toCross;new];
    other = mut(other,0.1,S,b);        %mutacia
    other = Cross(other,15);            % krizenie
    
                           
    
    pop = [bestStrings ; other]; 
    
    fit=Fitness(b,pop,endPointOfMaze);
    [minFitnew,indx]=min(fit);
    
    if minFitnew<minFit
        minFit=minFitnew;
        minRet=pop(indx,:);
    end    

    grafFit(i)=minFit;
end

b=track(b,minRet);                  %vykreslenie najlepsieho jedinca v bludisku
n=size(b,1);
image(b+1);colormap(hsv(5));
set(gca,'xtick',[1:1:n]);
set(gca,'ytick',[1:1:n]);  



figure
plot(grafFit,"m");      % vykreslenie priebehu hladania
hold on;
xlabel('Cykly');
ylabel('F(x)')
disp('Riesenie: ')


