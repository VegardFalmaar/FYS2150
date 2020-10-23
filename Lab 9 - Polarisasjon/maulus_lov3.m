theta1 = 0;
theta2 = [0 10 20 30 40 45 50 60 70 80 90].*pi./180;
theta3 = 90*pi/180;
illuminans = [6 8 12 16 18 18 18 15 11 8 6];
s_illuminans = 0.05.*illuminans + 2;

x = (cos(theta2 - theta1)).^2.*(cos(theta3 - theta2)).^2
experimental = illuminans - illuminans(end);

fit = fitlm(x, experimental)
figure()
hold on
plot(fit)
errorbar(x, experimental, s_illuminans, 'DisplayName', 'Datapunkter')
title('Lineærregresjon illuminans tre filtre')
xlabel('$\cos^2(\theta_2 - \theta_1) \cos^2(\theta_3 - \theta_2)$', 'Interpreter', 'latex')
ylabel('Illuminans, [lx]', 'Interpreter', 'latex')
legend('Interpreter', 'latex')
hold off

E_0 = fit.Coefficients.Estimate(2)
theoretical = E_0.*(cos(theta2 - theta1)).^2.*(cos(theta3 - theta2)).^2;

figure()
hold on
plot(theta2.*180./pi, theoretical, 'DisplayName', 'Teoretisk')
errorbar(theta2.*180./pi, experimental, s_illuminans, 'DisplayName', 'Eksperimentell')
title('Illuminans tre filtre', 'Interpreter', 'latex')
xlabel('$\theta_2$, [$^\circ$]', 'Interpreter', 'latex')
ylabel('Illuminans, [lx]', 'Interpreter', 'latex')
legend('Interpreter', 'latex')
hold off
