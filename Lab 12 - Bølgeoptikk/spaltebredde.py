import numpy as np

n_arr = np.array([2, 5, 9, 6])
delta_x_arr = np.array([22.3, 24.0, 22.2, 14.4]) # cm
delta_x_arr *= 10       # mm
s_delta_x = 3           # mm

lmbda = 632.8E-9    # m
lmbda *= 1E3        # mm
R = 9543            # mm
s_R = 7             # mm

def spaltebredde(n, delta_x):
    a = 2*n*lmbda*R/delta_x
    s_a = a*np.sqrt((s_R/R)**2 + (s_delta_x/delta_x)**2)
    return a, s_a

length = 2
header = '{:<10s}'*length
line = '{:<10.3f}'*length
print(header.format('a', 's_a'))
print('-'*10*length)

a_arr = []
s_a_arr = []

for n, delta_x in zip(n_arr, delta_x_arr):
    a, s_a = spaltebredde(n, delta_x)
    a_arr.append(a)
    s_a_arr.append(s_a)
    print(line.format(a, s_a))

# last slit
measurements = a_arr[-2:]
uncertainties = s_a_arr[-2:]
N = len(measurements)
a = np.mean(measurements)
s_a = np.sqrt(np.sum([s_a**2 for s_a in uncertainties]))/N
print('Mean last slit:')
print(line.format(a, s_a))
