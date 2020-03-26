U_nom = linspace(3.0, 5.0, 11); % kV
U_nom = U_nom.*1E3; % V
R = 10E6;   % ohm

I_anode = [8 10 13 15 18 21 24 27 31 35 39].*1E-6; % A
D_outer_l = [5.20 5.10 5.05 4.95 4.80 4.70 4.60 4.50 4.45 4.30 4.25].*1E-2; % m
D_inner_l = [4.50 4.40 4.30 4.30 4.20 4.10 4.05 4.00 3.90 3.75 3.65].*1E-2; % m
D_outer_s = [3.10 3.00 2.90 2.80 2.75 2.70 2.65 2.60 2.50 2.45 2.40].*1E-2; % m
D_inner_s = [2.50 2.40 2.35 2.35 2.30 2.25 2.20 2.15 2.10 2.00 1.95].*1E-2; % m

U = U_nom - R.*I_anode;

lambda_c = 2.426E-12;
lambda_no_correction = lambda_c.*sqrt(0.511E6/2./U);
lambda = lambda_no_correction.*relfactor(U.*1E-3)

fprintf('\n\nlambda over D for large ring:\n')
D = (D_outer_l + D_inner_l)./2;
lambda_over_D = lambda./D;
mean_value = mean(lambda_over_D)
std_dev = std(lambda_over_D)
relative_error = std_dev/mean_value
correction_factor_max = max((lambda_no_correction - lambda)./D)

fprintf('\n\nlambda over D for small ring:\n')
D = (D_outer_s + D_inner_s)./2;
lambda_over_D = lambda./D;
mean_value = mean(lambda_over_D)
std_dev = std(lambda_over_D)
relative_error = std_dev/mean_value
correction_factor_max = max((lambda_no_correction - lambda)./D)
