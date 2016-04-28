clf;

lambda = 0:1:60; % Arrivals per hour
tau = 0.5/60/60; % in hours (first term in seconds)

accident_rate = lambda .*(1-exp(-2.*lambda.*tau));

figure(1);
plot(lambda, accident_rate);
xlabel('Arrivals per Hour');
ylabel('Accidents per Hour');

arrival_rate = [1/10, 1/20, 1/30, 1/40, 1/50, 1/60];

clear T_EW;
clear T_NS;

N = 10000;
T_EW = zeros(6,N);
T_NS = zeros(6,N);

for i = 1:6
    T_EW(i,1)= exprnd(arrival_rate(i),1,1);
    T_NS(i,1)= exprnd(arrival_rate(i),1,1);
    for j = 2:N
        T_EW(i,j) = T_EW(i,j-1) + exprnd(arrival_rate(i),1,1);
        T_NS(i,j) = T_NS(i,j-1) + exprnd(arrival_rate(i),1,1);
    end
end

accident_count = zeros(6,1);
for i = 1:6
    for j = 1:N
        for k = 1:N
            if abs(T_EW(i,j)-T_NS(i,k)) <= tau
                accident_count(i) = accident_count(i)+1;
            end
        end
    end
end

figure(2);
hold on;
for i = 1:6
    plot(T_EW(i,:),i,'xr');
    hold on;
    plot(T_NS(i,:),i,'xb');
    hold on;
end

xlim([0 1]);
ylim([0 7]);
hold off;

% compare
figure(3);
for i = 1:6
    plot(10*i,accident_count(i)/T_EW(i,N),'xr');
    hold on;
end

for i = 1:6
    plot(10*i,10*i.*(1-exp(-2.*10*i.*tau)),'ob');
    hold on;
end

hold off;