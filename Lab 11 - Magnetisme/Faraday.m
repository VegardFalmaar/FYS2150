L = 30*1E-3; %m
s_L = 1*1E-3; %m

I_array = [3 2.5 1.5 1.0 -1.0 -1.5 -2.0 -2.5 -3.0]; %A
B_array = [119 102 83 63 43 -43 -63 -83 -102 -119].*1E-3; %T

theta_595 = [4.0 3.2 2.6 2.2 1.6 -1.4 -2.2 -2.8 -3.6 -4.4]; 
theta_580 = [5.0 4.2 3.4 2.6 1.8 -1.8 -2.8 -3.4 -4.4 -5.0]; 
theta_525 = [5.2 5.6 4.8 3.6 2.0 -2.0 -3.2 -4.4 -5.3 -6.2]; 
theta_440 = [10.0 7.8 6.6 4.8 2.6 -3.6 -5.8 -6.6 -8.8 -10.6]; 

theta = [theta_595; theta_580; theta_525; theta_440];
thetas = [595 580 525 440];

fprintf('\n%-17s | %-10s | %-10s \n',...
    'Wavelength, [nm]', 'V, [deg/T]', 's_V, [deg/T]')
fprintf('---------------------------------------------\n')
format = '%-17d | %-10.2f | %-10.2f \n';

for i=1:4
    fit = fitlm(B_array, theta(i, :));
    figure(i)
    plot(fit) 
    hold on
    title(['$\theta_{' num2str(thetas(i)) '}$'], 'Interpreter', 'latex')
    xlabel('B, [T]', 'Interpreter', 'latex')
    ylabel('$\theta$, [$^\circ$]', 'Interpreter', 'latex')
    hold off
    
    slope = fit.Coefficients.Estimate(2);
    s_slope = fit.Coefficients.SE(2);
    V = slope/L;
    s_V = V*sqrt((s_L/L)^2 + (s_slope/slope)^2);
    fprintf(format, thetas(i), V, s_V)
end 

