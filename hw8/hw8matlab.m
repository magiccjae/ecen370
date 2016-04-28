close all;
clear;

trials = 10000;
X = random('uniform', -1, 1, trials, 1);

bins = 40;
[nelements, centers] = hist(X, bins);
bin_length = centers(2) - centers(1);
prob_density_estimate = nelements / trials / bin_length;

figure(1);
bar(centers, prob_density_estimate);
xlabel('Values of X');
ylabel('Esimated probability density [probability/length]');
title('4.1: PDF of X');

Y = sqrt(abs(X));
[nelements, centers] = hist(Y, bins);
bin_length = centers(2) - centers(1);
prob_density_estimate = nelements / trials / bin_length;

figure(2);
hold on;

bar(centers, prob_density_estimate);

xlabel('Values of Y');
ylabel('Esimated probability density [probability/length]');
title('4.1: PDF of Y = sqrt(abs(X)) ');

hold off;

Y= - log(abs(X));
[nelements, centers] = hist(Y, bins);
bin_length = centers(2) - centers(1);
prob_density_estimate = nelements / trials / bin_length;

figure(3);
hold on;

bar(centers, prob_density_estimate);

xlabel('Values of Y');
ylabel('Esimated probability density [probability/length]');
title('4.1: PDF of Y = - log(abs(X)) ');

hold off;

figure(4);
hold on;

point = random('uniform', 0, 1, trials, 2); 
xlim([0 1]);
ylim([0 1]); 
plot(point(:,2), point(:,1), 'xb');
title('4.5: Field X , Y');
hold off;

% Z = abs(point(:,2)-point(:,1));
% ind = 1;
% count = 0;
% xaxis = [-1:.01:3];
% 
% for i = -1:.01:3;
%         cdf_z(ind) = length(find(Z<i));
%         ind = ind + 1;
% end
% 
% 
% subplot(4,1,3);
% plot(xaxis,cdf_z/max(cdf_z));
% subplot(4,1,2);
% [yout, xout] = hist(Z,10);
% area = (xout(2)-xout(1))*sum(yout);
% bar(xout,yout/area);
% title('Distribution of random variable abs[X-Y]');


Z = abs(point(:,2) - point(:,1));
bins = 20;
[nelements, centers] = hist(Z, bins);
normalized_elements = nelements / trials;
new_elements = zeros(1);
height = 0;
for i=1:bins 
   height = height + normalized_elements(i);
   new_elements(i) = height;
end

figure(5);
hold on;

bar(centers,new_elements);
title('4.5 CDF of Z');

hold off;

figure(6);
hold on;
hist(Z);
title('4.5: PDF of Z');
hold off;

figure(7);
hold on;
point = exp(random('uniform', 0, 1, trials, 2)); 
plot(point(:,2), point(:,1), 'xb');
title('4.8: Field X , Y');
hold off;

figure(8);
hold on;
Z = X + Y;
hist(Z);
title('4.8: Histogram Z');
hold off;