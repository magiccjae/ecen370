clear all;
close all;

trials = 10000;

figure(1);

clf;

point = rand([2 trials])*2 - 1;

plot(point(1,:),point(2,:), 'xb');

xlim([-1 1]);
ylim([-1 1]);

hold on;

count = 0;
expectation = [];

for i=1:trials
    if((point(1,i)*point(1,i)+point(2,i)*point(2,i)) < 1)
        
        plot(point(1,i),point(2,i), 'xr');
        
        count = count+1;
        
        expectation = [expectation sqrt((point(1,i)*point(1,i)+point(2,i)*point(2,i)))];
               
    end
        
end



probability = count / trials;
mymean = mean(expectation);
myvar = var(expectation);

title({strcat('Probability is:', num2str(probability));strcat('expectation is:', num2str(mymean));strcat('variance is:', num2str(myvar))});