m = [0 500 1000.5 1500.5 2000.9 2500.9 3001.4 3501.4];
h = [3.04 2.36 1.64 0.92 0.20 -0.50 -1.23 -1.96];
reg = fitlm(m, h);
coeffs = reg.Coefficients.Estimate;
A = coeffs(2);
B = coeffs(1);

errors = reg.Coefficients.SE;
dA = errors(2);

% hold on
% plot(reg)
% plot(m, h, 'o')
% hold off

l = 1334E-3
dl = sqrt((sqrt(6)*0.5)^2 + (1.4/2000*1334)^2 + 1)*1E-3
d_s = [16.04 16.08 16.03 16.05].*1E-3;
d = mean(d_s)
dd_statistic = std(d_s)/sqrt(length(d_s));
dd_systematic = 0.01E-3;
dd = sqrt(dd_statistic^2 + dd_systematic^2)
g = 9.819;

E = 4*l^3*g/(3*pi*abs(A)*d^4);
dE = E*sqrt((dA/A)^2 + (4*dd/d)^2 + (3*dl/l)^2);