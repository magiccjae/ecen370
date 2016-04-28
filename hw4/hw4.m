clear all;
close all;

load('burgerfry.mat');
   
% create 6x4 matrix with all 0s
BF = zeros(6,4);

for i = 1:10000
    row = outcomes(i,1);
    column = outcomes(i,2);
                
    BF(row,column) = BF(row,column)+1;

end
BF = BF/10000;

figure(1);
bar3(BF);
xlabel('fry values');
ylabel('burger values');
zlabel('PMF');
title('Original Joint PMF');

% 3 burgers and 2 fries
BF(3,2)


figure(2);
marg_y = sum(BF); % marginal fries
marg_x = sum(BF'); % marginal burgers

subplot(2,1,1);
bar(marg_x);
title('Marginal PMF for burgers');
xlabel('burger values');
ylabel('PMF');

subplot(2,1,2);
bar(marg_y);
title('Marginal PMF for fries');
xlabel('fry values');
ylabel('PMF');

% burger expectation
e_burger = 0;
for i = 1:6
    e_burger = e_burger + i*marg_x(i);
end

% fry expectation
e_fry = 0;
for i = 1:4
    e_fry = e_fry + i*marg_y(i);
end

g = 2*e_burger + 1*e_fry;

h = zeros(1,6);

for i = 1:6
    h(i) = BF(i,2);
end

figure(3);
h = h/marg_y(2);
bar(h);
title('the numbers of burgers given two fries');
xlabel('burger values');
ylabel('PMF');