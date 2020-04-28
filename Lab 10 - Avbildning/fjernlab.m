c = [90 90 120 120];    % cm
s_c = 0.5;              % cm
s = [30.2 59.0 25.0 94.8]; % cm
s_s = 0.2;              % cm
D_bilde = [3.020 0.740 5.714 0.357]; % cm
D_objekt = 1.500;       % cm
s_D = 0.002;            % cm


%[f, s_f] = focal_length_s(s, c, s_s, s_c)

disp('Eksperimentelt:')
[M90, s_M90] = forstorrelse_eksperimentell(D_objekt, D_bilde(1:2), s_D, s_D)
[M120, s_M120] = forstorrelse_eksperimentell(D_objekt, D_bilde(3:4), s_D, s_D)

disp('Teoretisk:')
[M90, s_M90] = forstorrelse_teoretisk(s(1:2), c(1:2), s_s, s_c)
[M120, s_M120] = forstorrelse_teoretisk(s(3:4), c(3:4), s_s, s_c)

x = 2.400/2;     % cm
d = 0.362E-1;    % cm
s_d = 0.002E-1;  % cm
[R, s_R] = radius_of_curvature(x, d, s_d)

lambda = 546.1;  % nm
[f, s_f] = focal_length_n(R, lambda, s_R)
