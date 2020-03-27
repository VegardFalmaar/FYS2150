K_alpha_1 = 154.4;  % nm
K_alpha_2 = 154.0;  % nm
K_beta_1 = 139.2;   % nm
K_beta_2 = 138.1;   % nm

K_alpha = (K_alpha_1 + K_alpha_2)/2*1E-12   % pm
K_beta = (K_beta_1 + K_beta_2)/2*1E-12      % pm

two_d = 629E-12;    % m
for (n=1:1:2)
    fprintf('n = %d :\n', n)
    theta_alpha = asin(n*K_alpha/two_d);
    fprintf('2 theta_alpha = %.2f degrees\n', 2*theta_alpha*180/pi)
    
    theta_beta = asin(n*K_beta/two_d);
    fprintf('2 theta_beta = %.2f degrees\n\n', 2*theta_beta*180/pi)
end

two_theta_1 = linspace(23, 30, 15);
counts_1 = [331 294 292 275 511 1376 961 353 318 302 1807 3696 1596 243 220];

two_theta_2 = linspace(50, 60.5, 22);
counts_2 = [176 153 170 162 180 400 275 170 175 163 150 162 147 158 150 166 224 1174 960 251 147 145];

hold on
plot(two_theta_1, counts_1)
plot(two_theta_2, counts_2)
legend('n = 1', 'n = 2')
xlabel('2 theta, [degrees]')
ylabel('Count per 10 s')
hold off

