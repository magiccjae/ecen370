close all;
clear all;

trials = 10000;
lamda = 2;

myarray = rand(1,trials);
values = -log(1-myarray)/lamda;

[y x] = hist(values);

area = ((x(2)-x(1))*sum(y));
bar(x,y/area);