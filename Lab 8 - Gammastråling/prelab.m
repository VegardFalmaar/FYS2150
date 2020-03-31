load('poisson.mat');
n = length(data)
k_mean = 1/n*sum(data);
m = k_mean
s = sqrt(1/(n - 1)*sum((data - k_mean).^2))


fprintf('\n\n\n\nQuestion 4\n')
n_r = 23;
n_b = 2;
A = 10E6;
d = 20E-2;   % Distance from the source
r = 2E-2;    % Window of the GM-counter

Omega = 2*atan(r/d);
epsilon = (n_r - n_b)/(A*Omega/4/pi);
fprintf('\nepsilon = %.4f prosent \n', epsilon*100)


fprintf('\n\n\n\nQuestions 5 and 6\n')
skjerming = [0 4 8 12 16 20 24]*1E-3;
n = [13.7 12.4 11.0 9.7 8.9 7.9 7.1];

x = skjerming;
y = log(n);

fit = fitlm(x, y)


fprintf('\n\n\n\nQuestion 7\n')

mu = 55; % m^(-1)
I_over_I0 = 0.05;
z = log(I_over_I0)/(-mu)
fprintf('\nz = %.4f mm \n', z*1000)



fprintf('\n\n\n\nQuestion 7\n')

load('spektrum.mat')
start = 665;
stop = 999;
slope = (spektrum(stop) - spektrum(start))/(stop - start);
x = linspace(0, stop-start, stop-start+1);
linear = spektrum(start) + slope*x;

figure()
hold on
plot(spektrum)
plot(start, spektrum(start), 'ro')
plot(stop, spektrum(stop), 'ro')
plot(x+start, linear)
hold off

height = spektrum(start:stop) - transpose(linear);
max_val = max(height)
idx = find(height > max_val/2);
FWHM = 2*length(idx) % keV
% Delta E = 2 is the increase of energy for every increase in I

figure()
hold on
plot(height)
plot([idx(1) idx(FWHM/2)], height([idx(1) idx(FWHM/2)]), 'r')
hold off













