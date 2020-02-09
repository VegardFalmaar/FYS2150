tau=[4.12, 4.04, 4.16, 4.02, 4.03, 4.04, 3.89, 4.2, 4.12, 4.05];
time = mean(tau)

m = 2.0;
k = 4*pi^2*m/time^2


n = length(tau);
s = sqrt(1/(n-1)*sum((tau -time).^2));

SE = s/sqrt(n)