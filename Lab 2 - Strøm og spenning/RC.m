frekvens = [10 100 1000 10000 100000 1000000];
U_inn = [1.99 1.958 1.884 1.878 1.85 1.72];
U_ut = [1.972 1.636 0.2905 0.0297 0.0031 0];

omega = frekvens.*2*pi;

x = log10(omega);
y = log10(U_ut./U_inn);
% 
% hold on
% plot(x, y)
% plot(x, y, 'o')
% 
fit = fitlm(x(2:5), y(2:5))
% plot(fit)
% hold off


coeffs = fit.Coefficients.Estimate
omega0 = 10^(coeffs(1))
R = 10000
C = 1/(R*omega0)
