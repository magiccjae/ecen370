clear all;
close all;

trials = 10000;

Nvec=[1 2 3 5 10 100];

y = zeros(length(Nvec),trials);

for i=1:length(Nvec)
    for j=1:Nvec(i)
        y(i,:)=y(i,:)+random('exponential',1,[1 trials]);
    end
        ymean(i) = mean(y(i,:));
        yvar(i) = var(y(i,:));
        ystd(i) = std(y(i,:));
end

figure(1);
for i=1:length(Nvec)
    subplot(3,2,i);
    [yout xout] = hist(y(i,:),50);
    area = sum(yout)*(xout(2)-xout(1));
    hold on;
    bar(xout,yout/area);
    X=0:.01:Nvec(i);
    plot(X, normpdf(X,ymean(i),ystd(i)));
    hold off;
end

ymean
ystd
yvar