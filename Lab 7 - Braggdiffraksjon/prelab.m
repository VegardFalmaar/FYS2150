E = 20E3;     % eV
lambdaE = 1.241E-6;

lambda = lambdaE/E
disp(lambda/1E-12)

deg = linspace(12, 25, 14);
I = [130 124 133 131 128 132 138 192 244 301 348 403 462 508];

plot(deg, I)

theta = 18/2*pi/180;
d = 200.5E-12;
lambda = 2*d*sin(theta);
E = lambdaE/lambda

disp('Question 7')
relfactor(8)

disp('Question 8')
data = importdata('diameter.dat');
U = data(:, 1);
D_outer = data(:, 2);

lambda_c = 2.426E-12;
lambda = lambda_c.*sqrt(0.511E6/2./U).*relfactor(U.*1E-3)

n = length(U)
phi_mean = 1/n*sum(lambda./D_outer)

s_phi = n/200


disp('Question 9')
s_L = 3;
L = 127;
s_phi = 0.08;
phi = 8.31;
relative = sqrt((s_L/L)^2 + (s_phi/phi)^2)