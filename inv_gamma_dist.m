N = 1000000;
x0 = 2*randn(1);
samps = [];
lastsamp = abs(x0);
alpha = 2;
beta = 1;

for i = 1:N
    newsamp = 2*randn(1)+lastsamp;
    if min(1, exp(-beta/newsamp)*lastsamp^(alpha+1)/(exp(-beta/lastsamp)*newsamp^(alpha+1)) ) > rand(1) && newsamp>0
        samps = cat(2,samps,newsamp);
        lastsamp = newsamp;
    end
    
end

histogram(samps,200/alpha,'Normalization','pdf');
hold on
x = 0:0.1:20;
plot(x,beta^alpha*exp(-beta./x)./(gamma(alpha).*x.^(alpha+1)));
hold off;