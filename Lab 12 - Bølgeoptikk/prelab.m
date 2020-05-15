N = 1;
A = 1;
a = 0.12E-3;     % m
R = 5;
x = -50:0.0001:50; % mm
x = x*1E-3;      % m

I = illuminance(x, R, a, N, A);
figure(1)
plot(x*1E3, I)
hold on
xlabel('x, [mm]')
ylabel('Relative illuminance')
hold off

d_1 = 10.5;
d_2 = 13;
d_3 = 16.5;
[delta_nu, B] = zeeman(d_1, d_2, d_3)