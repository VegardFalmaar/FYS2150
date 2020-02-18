half_periods = [3.66 3.83 3.76 3.82 3.74 3.79 3.76 3.83 3.77 3.81 3.71 3.78 3.80 3.78 3.79 3.81];
n = length(half_periods)
half_period = mean(half_periods)
std_dev = std(half_periods)/sqrt(n)

T = 2*half_period
dT = 2*std_dev

g = 9.819;
L = g/4/pi^2*T^2
dL = L*2*dT/T

l1 = (21.5+13.7)/2/100
l2 = 13.856
lp = L +l1 - l2