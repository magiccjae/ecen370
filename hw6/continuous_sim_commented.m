% This is creating a new variable 'N' and assigning it the value of
% 100. (This will be how many points are created.)
N = 100; 

% This opens figure 1
figure(1); 

% This clears the open figure
clf; 

% This creates a 2xN matrix filled with random values between 0 and 1. 
% These are the points. Think of it as a two-dimensional array. For each 
% x-value, there is an associated y-value with 100 points in total.
point = rand([2 N]); 

% This plots the array of points onto the open figure. The colon indicates
% iteration through all of the values stored in that vector and 'xb' 
% indicates the color blue
plot(point(1,:), point(2,:), 'xb'); 

% This limits the view of the x-axis of the open figure to 0-1
xlim([0 1]);

% This limits the view of the y-axis of the open figure to 0-1
ylim([0 1]); 

% The 'hold on' function retains the current plot and properties of the 
% open figure so future plot commands add to the graph instead of 
% replacing it
hold on; 

% Creates a new variable 'count' and assigns it the value of 0. (This will 
% be used to count how many points fall within a certain range.)
count = 0; 

% This sets up a recurring loop that repeats 'N' times. 
for i=1:N 
    
    % This checks every point in the array. If the point is within the
    % bounds (both the 'x' and 'y' values of the point are less than .5) 
    % then the code inside the 'if' statement is executed.
    if (point(1, i) < 0.5) && (point(2,i) < 0.5) 
        
        % This re-plots the point in the color red.
        plot(point(1,i), point(2,i), 'xr') 
        
        % This increments the counter (counting the number of points within
        % the boundaries).
        count = count + 1; 
    end
end

% This divides the number of blue points by the total number of points and
% assigns it to the new variable 'probability'.
probability = count / N;

% 'num2str' takes the number 'probability' and returns it as a string.
% 'strcat' concatenates the two parameters into a single string.
% 'title' sets the open figure's title to the string entered. 
title(strcat('Probability is:', num2str(probability))); 











