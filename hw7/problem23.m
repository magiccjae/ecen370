clear all;
close all;

trials = 10000;

figure(1);

clf;

point = rand([2 trials]);

plot(point(1,:),point(2,:), 'xb');

xlim([0 1]);
ylim([0 1]);

hold on;

count = 0;
pointarray = [];
conditional = [];
x_expectation = [];

for i=1:trials
    if((point(1,i)+point(2,i)) < 1)
        
        pointarray = [pointarray, point(1:2,i)];
        
        plot(point(1,i),point(2,i), 'xr');
        
        x_expectation = [x_expectation, point(1,i)];
        
        count = count+1;
        
        if(point(2,i) < 0.55 && point(2,i) > 0.45)
           conditional = [conditional, point(1:2,i)];
            
        end                       
    end
        
end

probability = count / trials;
title('Triangle');

% marginal Y
%figure(2);
%hist(pointarray(1,:));  % histogram of all x values
[y_value,x_value] = hist(pointarray(1,:)); % marginal Y = sum of all X values
area = (x_value(2)-x_value(1))*sum(y_value); 
figure(3);
bar(x_value,y_value/area); % normalized plot
title('Marginal PDF of Y');

% conditional X given Y
%figure(4);
%hist(conditional(1,:));  % histogram of all x values
[y_value,x_value] = hist(conditional(1,:));  
area = (x_value(2)-x_value(1))*sum(y_value); 
figure(5);
bar(x_value,y_value/area); % normalized plot
title('Conditional PDF of X given Y');

% expectation of x
mean(x_expectation)