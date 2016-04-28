%%%%
% ECEn 370 Homework 4 Problem Example
% January 28, 2011
clear all;

% Oftentimes it is easier to look at a matrix to determine the Joint PMF of
% a set of random variables. Suppose for example, that you have the
% following:

% Load the PMF into XY
%             Y Values from 1 to 6
XY = [ 0.00 0.15 0.00 0.00 0.05 0.01;... %
       0.10 0.05 0.05 0.00 0.00 0.02;... %
       0.00 0.10 0.10 0.10 0.00 0.01;... %
       0.05 0.05 0.00 0.00 0.00 0.01;... % X-Values from 1 to 7
       0.02 0.02 0.02 0.00 0.00 0.01;... %           
       0.02 0.01 0.00 0.00 0.01 0.02;... %          
       0.00 0.00 0.00 0.00 0.00 0.02...  %           
       ];
%  
% What this matrix is indicating is that the probability at a point, say
% (X=3,Y=4) is 0.10. In this case, the matrix is indexed from the upper
% left corner.
%
% The folowing will give you the probability for the point (X=3, Y=4)
XY(3,4)

% The following code then plots the matrix above
figure(1); % Loads a new figure
bar3(XY);  % Plots a 3-dimensional bar graph
xlabel('Y values'); % Places labels on the x-axis of bar graph
ylabel('X values'); % Places labels on the y-axis of bar graph
zlabel('Probability Mass'); % Places labels on the z-axis of bar graph
view(-100, 50); % Sets the vantage point for viewing the bar graph
title('Original Joint PMF');

%
% From the probability matrix, you can calculate any of the probabilities
% you would like to find. Below is an example of doing calculations on the
% matrix to find the marginal probabilities for X and Y.
%

figure(2); % Loads a new figure.
marg_y = sum(XY); % This sums over each column of the matrix XY.
marg_x = sum(XY'); % This sums over each column of the transposed matrix XY.
% Note that the ' transposes a matrix.

subplot(2,1,1); % This produces a subplot in the figure in top position.
bar(marg_x);    % Produces bar graph of marginal PMF for X.
title('Marginal PMF for X');
xlabel('X Values');
ylabel('Probability Mass');

subplot(2,1,2); % This produces a subplot in the figure in bottom position.
bar(marg_y);    % Produces bar graph of marginal PMF for Y.
title('Marginal PMF for Y');
xlabel('Y Values');
ylabel('Probability Mass');



%
% Now suppose that you want to simulate outcomes from the above joint PMF.
% The following code allows you to do that. First, we specify the number of
% trials we want to perform. Then we actually simulate all of those trials.
% Make sure that you have simulate_joint_PMF.m in your working directory so
% that you can call that function. The simulate_joint_PMF function takes in
% two arguments, the matrix representing the probabilities and the number
% of trials to perform. It returns a matrix that has two columns
% representing the X and Y coordinates for each outcome.
%
trials = 10000; % Specifies the number of trials: try this for different
                % values to see how the estimates change. 
outcomes = simulate_joint_PMF(XY,trials); % Produces outcomes from the joint PMF.


%
% Suppose that you want to estimate what the original joint PMF looked
% like. You can do this by counting up all of the outcomes (each X,Y
% combintation) and then dividing by the total number of trials that were
% performed. The following code does just that.
%
XY_tally = zeros(size(XY)); % This initializes an array for your outcomes.
for c = 1:trials
    % This counts up for each (X,Y) location how many times it appeared in
    % the data.
    XY_tally(outcomes(c,1), outcomes(c,2)) = XY_tally(outcomes(c,1), outcomes(c,2)) + 1;
end
%
% The following code estimates the probability at each X,Y location by
% dividing by the total number of trials.
XY_estimated_probability = XY_tally ./ trials;

%
% This code then plots the estimated probability mass from the outcomes
% that you obtained from your numerical simulation of the joint PMF.
%
figure(3); % Loads a new figure
bar3(XY_estimated_probability);  % Plots a 3-dimensional bar graph
xlabel('Y values'); % Places labels on the x-axis of bar graph
ylabel('X values'); % Places labels on the y-axis of bar graph
zlabel('Probability Mass'); % Places labels on the z-axis of bar graph
view(-100, 50); % Sets the vantage point for viewing the bar graph
title('Estimated Probability Mass');
