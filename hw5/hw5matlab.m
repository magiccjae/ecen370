clear all;
close all;

trial = 10000;
myarray = rand(1,trial);

mymatrix = zeros(2,2);

for i = 1:trial
    if(myarray(i)<=1/8)
        mymatrix(1,1) = mymatrix(1,1)+1;
    elseif(myarray(i)>1/8 && myarray(i)<=2/8)
        mymatrix(1,2) = mymatrix(1,2)+1;
    elseif(myarray(i)>2/8 && myarray(i)<=4/8)
        mymatrix(2,1) = mymatrix(2,1)+1;
    else
        mymatrix(2,2) = mymatrix(2,2)+1;
    end
end

mymatrix = mymatrix/trial

% figure(1);
% bar3(mymatrix);
% xlabel('y value');
% ylabel('x value');
% zlabel('PMF');
% title('Original Joint PMF');

x_marg = sum(mymatrix)

y_condition_x0 = zeros(1,2);
for i = 1:trial
    if(myarray(i)<=1/3)
        y_condition_x0(1,1) = y_condition_x0(1,1)+1;
    else
        y_condition_x0(1,2) = y_condition_x0(1,2)+1;
    end
end
y_condition_x0 = y_condition_x0/trial

y_condition_x1 = zeros(1,2);
for i = 1:trial
    if(myarray(i)<=1/5)
        y_condition_x1(1,1) = y_condition_x1(1,1)+1;
    else
        y_condition_x1(1,2) = y_condition_x1(1,2)+1;
    end
end
y_condition_x1 = y_condition_x1/trial

y_condition = zeros(2,2);
y_condition(1,1) = y_condition_x0(1)*x_marg(1);
y_condition(2,1) = y_condition_x0(2)*x_marg(1);
y_condition(1,2) = y_condition_x1(1)*x_marg(2);
y_condition(2,2) = y_condition_x1(2)*x_marg(2);
y_condition

x_exp_analytic = 3/8*0 + 5/8*1

x_exp_simulated = 0*x_marg(1) + 1*x_marg(2)

x_var_analytic = (0-x_exp_analytic)^2*3/8 + (1-x_exp_analytic)^2*5/8

x_var_simulated = (0-x_exp_simulated)^2*x_marg(1) + (1-x_exp_simulated)^2*x_marg(2)
