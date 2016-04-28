%%%%
% ECEn 370 Homework 8 Example
% February 27, 2014
clear all;

% I will do this for Example 4.2 in the book.
% Suppose I want to start by sampling 10,000 points from a uniform
% distribution from 30 to 60. I can generate these by the following code.
Num_trials = 10000;
X = 30 * rand(Num_trials,1) + 30;

% Then I want to plot an estimate of the PDF for this distribution. I first
% will need to create a histogram of the trial outcomes and then estimate
% the PDF by dividing by the total number of trials to estimate the 
% probability for each bin. But since I need a probability per length, then 
% I also need to divide by the length of each bin.

Num_bins = 40;
[nelements, centers] = hist(X, Num_bins);
bin_length = centers(2) - centers(1);
prob_density_estimate = nelements / Num_trials / bin_length;

% This will then plot the estimated probability density function
figure(1);
plot(centers, prob_density_estimate);
xlabel('Values of x');
ylabel('Esimated probability density [probability/length]');


% Suppose I then want to find Y = g(X) and my function is Y = 180/X. I then
% will follow this same procedure for the outcomes of this formula applied
% to X.

Y = 180 ./ X;

% Again I use this same procedure that I used for X.
[nelements, centers] = hist(Y, Num_bins);
bin_length = centers(2) - centers(1);
prob_density_estimate = nelements / Num_trials / bin_length;

% I will plot my estimated probability density
figure(2);
plot(centers, prob_density_estimate);
xlabel('Values of y');
ylabel('Esimated probability density [probability/length]');


% The exact answer for this problem is found on page 204, where f_Y(y) is
% defined as 6/y^2 if 3 < y < 6 and 0 otherwise. We can compare our
% estimated pdf using our simulation with the exact result using the
% following code.

hold on;
y_exact = linspace(3,6,100);
pdf_y = 6 ./ y_exact.^2;
plot(y_exact, pdf_y, 'r-');
hold off;

% This places a legend on the graph of the probability density.
legend('Estimated probability density', 'Exact solution');

