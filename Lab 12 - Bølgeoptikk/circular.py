import numpy as np
from format import Table

def radius(a, omega):
    return omega*lmbda*R/np.pi/a

omegas = [3.832, 7.016, 10.173, 13.324]
R = 1.634           # m
lmbda = 632.8E-9    # m
a_list = [0.12, 0.24, 0.48]         # mm
a_list = [a*1E-3 for a in a_list]   # m

data = [['a, [mm]'] + [f'd_{i}, [cm]' for i in range(1, 5)]]
for a in a_list:
    line = ['{:.2f}'.format(a*1E3)]
    line += ['{:.2f}'.format(2*radius(a, omega)*1E2) for omega in omegas]
    data.append(line)

tab = Table(data)
tab.write()
