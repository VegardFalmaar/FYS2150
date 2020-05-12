L = 30*1E-3; %m
s_L = 1*1E-3; %m


theta = V*L*B;

I_array = [3 2.5 1.5 1.0 -1.0 -1.5 -2.0 -2.5 -3.0]; %A
B_array = [119 102 83 63 43 -43 -63 -83 -102 -119].*1E-3; %T

theta_595 = [4.0 3.2 2.6 2.2 1.6 -1.4 -2.2 -2.8 -3.6 -4.4]; 
theta_580 = [5.0 4.2 3.4 2.6 1.8 -1.8 -2.8 -3.4 -4.4 -5.0]; 
theta_525 = [5.2 5.6 4.8 3.6 2.0 -2.0 -3.2 -4.4 -5.3 -6.2]; 
theta_440 = [10.0 7.8 6.6 4.8 2.6 -3.6 -5.8 -6.6 -8.8 -10.6]; 

% theta = [theta_595 theta_580 theta_525 theta_440]
% for i=1:4
%     figure(i)
%     fit = fitlm(B_array, theta(i))
%     plot(fit) 
%     slope = fit.Coefficients.Estimate(2);
%     s_slope = fit.Coefficients.SE(2);
%     V = slope/L
% end 

figure(1)
fit1 = fitlm(B_array, theta_595);
plot(fit1)

figure(2)
fit2 = fitlm(B_array, theta_580);
plot(fit2)

figure(3)
fit3 = fitlm(B_array, theta_525);
plot(fit3)

figure(4)
fit4 = fitlm(B_array, theta_440);
plot(fit4)

slope1 = fit1.Coefficients.Estimate(2);
s_slope1 = fit1.Coefficients.SE(2);

slope2 = fit2.Coefficients.Estimate(2);
s_slope2 = fit2.Coefficients.SE(2);

slope3 = fit3.Coefficients.Estimate(2);
s_slope3 = fit3.Coefficients.SE(2);

slope4 = fit4.Coefficients.Estimate(2);
s_slope4 = fit4.Coefficients.SE(2);

V_595 = slope1/L
s_V_595 = V_595*sqrt((s_L/L)^2 + (s_slope1/slope1)^2)

V_580 = slope2/L
s_V_580 = V_580*sqrt((s_L/L)^2 + (s_slope2/slope2)^2)

V_525 = slope3/L
s_V_525 = V_525*sqrt((s_L/L)^2 + (s_slope3/slope3)^2)

V_440 = slope4/L
s_V_440 = V_440*sqrt((s_L/L)^2 + (s_slope4/slope4)^2)


