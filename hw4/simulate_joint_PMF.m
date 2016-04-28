function [ XY_outcomes ] = simulate_joint_PMF(XY, trials)
%
% Make sure that you have this file in your working directory when you
% attempt to do the MATLAB problem for homework 4.
%
% This function simulates outcomes form a joint PMF for a simple XY,
% starting with a matrix that in its rows gives values for X and in its
% columns gives values for Y. So at any (X,Y) you have the joint
% probability of that point. To simulate this, a uniform random variable is
% used to then select which of the (X,Y) points according to the relative
% probability of each point.
%
% ECEn 370
% Dr. Brian Mazzeo
% January 29, 2011
%

if abs(sum(sum(XY)) - 1) > 1e-8
    display('Bad PMF Matrix - Make sure all elements sum to 1');
    return;
end

% Finds size of matrix
[y_size x_size] = size(XY);

% This reshapes the matrix into one long vector. The reason for this is so
% to make it easy to move through the matrix.
decider_matrix = reshape(XY,x_size * y_size,1);
%size(decider_matrix)

% Executes the number of trials specified in the input argument.
for count = 1:trials
    target = rand(1); % Produces an outcome from a uniform random variable.
    place = 0; % This is the starting position
    while (1 - (target <= 0)) 
        % This finds the corresponding area segment by subtracting off the
        % probabilities of each of the places as the place-counter is
        % incremented. Essentially, if all the probabilities are now on a
        % line, then this finds which part of the line corresponds to the
        % selected position.
        place = place + 1; 
        target = target - decider_matrix(place);
    end
    
    place = place - 1; 
    %We need this because to use the modulo arithmetic, things are actually
    %going to get to a position of zero, but that is not allowed as a
    %matrix index in MATLAB.
    
    y = floor(place/y_size)+1;
    x = rem(place,y_size)+1;
    outcome(count,1) = x;
    outcome(count,2) = y;
end

XY_outcomes = outcome;

end

