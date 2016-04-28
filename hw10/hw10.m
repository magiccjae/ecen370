n = 100;
p = 0.25;
trial = 10000;
myarray = [];

for i = 1:trial
    num_people = random('Binomial',n,p);
    each_spent = 0;
    for j = 1:num_people
       each_spent = each_spent + rand(1)*50;
    end
    myarray(i) = each_spent;
end

mean_Y = mean(myarray)
std_Y = std(myarray)

[y x] = hist(myarray,50);
area = ((x(2)-x(1))*sum(y));
bar(x,y/area);
title('histogram of the pdf of Y');