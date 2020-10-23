angles = linspace(12, 22, 21);
counts = [308 345 320 325 290 320 280 314 333 327 531 794 939 1080 1252 1332 1497 1540 1671 1848 1765];

start = 10;
stop = 20;

flat = fitlm(angles(1:start), counts(1:start))
slope = fitlm(angles(start:stop), counts(start:stop))

figure()
hold on
plot(angles, counts, 'o')
plot(flat)
plot(slope)
ylabel('Counts per 60 seconds')
xlabel('Angle, [degrees]')
title('Bremsestråling, LiF-krystall')
hold off

x = linspace(14, 18, 10000);
coeffs = flat.Coefficients.Estimate;
a1 = coeffs(1);
s_a1 = flat.Coefficients.SE(1);
a2 = coeffs(2);
s_a2 = flat.Coefficients.SE(2);
line1 = coeffs(1) + coeffs(2)*x;

coeffs = slope.Coefficients.Estimate;
b1 = coeffs(1);
s_b1 = slope.Coefficients.SE(1);
b2 = coeffs(2);
s_b2 = slope.Coefficients.SE(2);
line2 = coeffs(1) + coeffs(2)*x;

diff = abs(line1 - line2);
idx = find(diff == min(diff));
angle_intersection = (b1 - a1)/(a2 - b2)

partial_angle_a1 = 1/(a2 - b2);
partial_angle_b1 = 1/(a2 - b2);
partial_angle_a2 = (b1 - a1)/(a2 - b2)^2;
partial_angle_b2 = (b1 - a1)/(a2 - b2)^2;

s_double_angle = angle_intersection*sqrt((partial_angle_a1*s_a1)^2 + (partial_angle_a2*s_a2)^2 + (partial_angle_b1*s_b1)^2 + (partial_angle_b2*s_b2)^2)
s_angle = s_double_angle/2;

figure()
hold on 
plot(x, line1)
plot(x, line2)
plot(x(idx), line1(idx), 'ro')
hold off

theta_min = angle_intersection/2*pi/180;
two_d = 401E-12
lambda = two_d*sin(theta_min)  % Wavelength of the photons with the highest energy
lambdaE = 1.241E-6;         % lambda E = h c
E = lambdaE/lambda          % eV, this number is the same as the voltage
s_E = E^2/tan(theta_min)*s_angle

nominal_E = 20E3;
E_relative = E/nominal_E





















