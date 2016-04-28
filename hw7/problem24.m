clear all;
close all;

trials = 10000;

figure(1);

clf;

point = rand([2 trials])*2;

plot(point(1,:),point(2,:), 'xb');

xlim([0 2]);
ylim([0 2]);

hold on;

count = 0;
pointarray = [];
x_expectation = [];
y_expectation = [];

for i=1:trials
    if((2*point(1,i)+point(2,i)) < 2)
        
        pointarray = [pointarray, point(1:2,i)];
        
        plot(point(1,i),point(2,i), 'xr');
        
        x_expectation = [x_expectation, point(1,i)];
        y_expectation = [y_expectation, point(2,i)];
        
        
        count = count+1;
        
    end
        
end

probability = count / trials;
title(['Triangle']);

mean(x_expectation)
mean(y_expectation)