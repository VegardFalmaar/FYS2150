[signal,sf]=audioread('messing_lyd.wav');
dt = 1/sf;
N = length(signal);
T = N*dt;
t = linspace(0, T, N);
t = transpose(t);
% f = 1.105E3;
f = 1.106E3;
% f = 1.100E3;
% f = 1.109E3;
% f = 1.095E3;

A = max(abs(signal));
lyd = A.*sin(2*pi*f*t);
size(lyd)
size(signal)

sum = signal + lyd;
sound(sum(1:50000))
plot(t, sum)