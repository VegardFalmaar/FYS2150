theta = linspace(0, 90, 10);
noise = 5;
illuminans = [80 77 71 61 49 36 25 15 9 6] - noise;
s_illuminans = 0.05.*illuminans + 2

x = (cos(theta.*pi./180)).^2;
y = illuminans - illuminans(end);

fit = fitlm(x, y)

figure()
hold on
plot(fit)
errorbar(x, y, s_illuminans)
title('Illuminans to filtre', 'Interpreter', 'latex')
xlabel('$\cos^2(\theta)$', 'Interpreter', 'latex')
ylabel('$E(\theta) - E(90^\circ)$', 'Interpreter', 'latex')
hold off
