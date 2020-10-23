I = [0.00 0.20 0.40 0.60 0.80 0.20 1.20 1.40 1.60]; %A
B1 = [27.1 188.7 348.1 497.9 625.7 729.1 804.5 861.5 906.2].*1E-3; %T
delta_m = [0.00 -0.01 0.00 -0.03 -0.09 -0.13 -0.17 -0.20 -0.25].*1E-3; %kg
d_array = [8.31 8.26 8.17 8.17 8.24 8.21]*1E-3; %m

mu_0 = 4*pi*1E-7;
g = 9.819; %m/s^2
F = g.*delta_m;
d = mean(d_array);
s_d = std(d_array)/sqrt(length(d_array));
A = pi*(d/2)^2;
s_A = A*s_d/d*2;

fit = fitlm(B1.^2, F)
figure(1)
plot(fit)
hold on
title('Kvadratisk sammenheng')
xlabel('$B_1^2$', 'Interpreter', 'latex')
ylabel('$F_z$', 'Interpreter', 'latex')
hold off

fit_linear = fitlm(B1, F)
figure(2)
plot(fit_linear)
hold on
title('Lineær sammenheng')
xlabel('$B_1$', 'Interpreter', 'latex')
ylabel('$F_z$', 'Interpreter', 'latex')
hold off

slope = fit.Coefficients.Estimate(2);
s_slope = fit.Coefficients.SE(2);

susc = 2*mu_0/A*slope
s_susc = susc*sqrt((s_slope/slope)^2 + (s_A/A)^2)

