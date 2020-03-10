%%% Oil
framerates = [59.8910 60 59.9873 59.9697 60 60 60 60 60];
diameters = [9.00 10.49 7.94 5.99 3.96 3.17 2.01 1.50 0.99];
dt = 1./framerates;
velocities = zeros(1, length(framerates));
s_velocities = zeros(1, length(framerates));

ml_dist = 25.5/50; % 25.5 mm per 50 ml

ml = [62.5 70 55 40];
dist_1_through_4 = ml.*ml_dist;
velocities(1:4) = dist_1_through_4./(3.*dt(1:4));

frames_5_through_9 = [6.5 9 19 32 71];
velocities(5:9) = 25.5./(frames_5_through_9.*dt(5:9));

%% Uncertainties
% 1 through 4
s_ml = [2.5 1 5 2.5];
s_ml_dist = 0.5/50;
s_vel = velocities(1:4).*sqrt((s_ml./ml).^2 + (s_ml_dist/ml_dist)^2);
s_velocities(1:4) = s_vel;

% 5 through 9
s_frames = [0.5 0.1 0.5 0.1 0.5];
s_vel = velocities(5:9).*sqrt((s_ml_dist/ml_dist)^2 + (s_frames./frames_5_through_9).^2);
s_velocities(5:9) = s_vel;

%% Big steel balls in oil and styrofoam balls in air
big_steel_diameters = [10.51 15.00 16.00 19.03 22.22 25.40 28.57 31.73 38.00 63.52];
big_steel_vels = [7.20 10.80 10.80 13.50 15.43 18.00 18.00 21.60 21.60 27.00].*1E2;

styro_diameters = [18.84 23.76 28.11 39.40 47.57 56.38 92.0 148];
styro_vels = [4.3 4.5 4.5 5.7 6.4 6.0 9.8 7.7].*1E3;

fit1 = fitlm(log(diameters(7:9)), log(velocities(7:9)))
disp('Coefficients slow oil:')
coeffs = fit1.Coefficients.Estimate
b_s = coeffs(1)
fit2 = fitlm(log(big_steel_diameters(5:10)), log(big_steel_vels(5:10)))
disp('Coefficients fast oil:')
coeffs = fit2.Coefficients.Estimate
fit3 = fitlm(log(styro_diameters), log(styro_vels))
disp('Coefficients air:')
coeffs = fit3.Coefficients.Estimate


% Plots
hold on
plot(fit1)
plot(fit2)
plot(fit3)

plot(log(diameters), log(velocities), 'o')
plot(log(big_steel_diameters), log(big_steel_vels), 'o')
plot(log(styro_diameters), log(styro_vels), 'o')
% legend('Data', 'Fit', 'Confidence bounds', 'Small', 'Large', 'Styro')
% legend('Small', 'Large', 'Styro')

hold off
