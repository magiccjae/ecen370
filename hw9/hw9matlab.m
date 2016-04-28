A=importdata('car_data_1991_for_HW.txt');
heading=A.textdata(1,2:6);

weight_mpg = corr(A.data(:,3), A.data(:,5));

weight = A.data(:,5);
mpg = A.data(:,3);

hold on;
figure(1);
plot(mpg, weight,'bx');

var_y = var(weight);
mean_y = mean(weight);
var_x = var(mpg);
mean_x = mean(mpg);

y_hat = mean_y + weight_mpg*(mpg-mean_x);

plot(mpg, y_hat,'-r');
hold off;


space = A.data(:,1);
horsepower = A.data(:,2);

space_horsepower = corr(A.data(:,1),A.data(:,2));

var_y = var(space);
mean_y = mean(space);
var_x = var(horsepower);
mean_x = mean(horsepower);

y_hat = mean_y + space_horsepower*(horsepower-mean_x);
figure(2);

hold on;
plot(horsepower, space, 'bx');
plot(horsepower, y_hat, '-r');
hold off;

