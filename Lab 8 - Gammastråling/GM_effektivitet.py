import numpy as np
import matplotlib.pyplot as plt
from format import Table

### Oppgave 3.2

A = 156.0E3       # Bq

d = 15.3          # cm
r = 2.2 / 2       # cm
delta_d = 0.1     # cm

omega = (np.pi*r**2)/(d**2)

N = 3

def eps(n_r, n_b, A):
    return (n_r - n_b) / (A*omega/4/np.pi)

n_r = np.array([179, 182, 176])/60
n_b = np.array([53, 39, 42])/60

n_r_mean = np.mean(n_r)
n_b_mean = np.mean(n_b)
print(n_r_mean)
print(n_b_mean)
print()

n_r_std = np.sqrt(n_r_mean)/60
n_b_std = np.sqrt(n_b_mean)/60
print(n_r_std)
print(n_b_std)
print()

delta_omega = 2*omega*delta_d/d

epsilon = eps(n_r_mean, n_b_mean, A)
delta_epsilon = np.sqrt(4*np.pi/A/omega*(n_r_std**2 + n_b_std**2 + ((n_r_mean-n_b_mean)/omega*delta_omega)**2))

print(epsilon*100)
print(delta_epsilon*100)

### Oppgave 4

p1 = [5.10, 5.10, 5.20, 5.20]
p2 = [5.10, 5.30, 5.20, 5.20]
p3 = [5.40, 5.30, 5.20, 5.15]
p4 = [5.05, 5.00, 5.10, 5.30]
p5 = [5.35, 5.50, 5.20, 5.30]

means = [0] # Lead thickness
stds = [0]  # Lead thickness

for i, p in enumerate([p1, p2, p3, p4, p5]):
    p_mean = np.mean(p)
    means.append(p_mean)
    p_std = np.std(p)/np.sqrt(len(p))
    stds.append(p_std)
    print('Blytykkelse plate {} = {:.3f}'.format(i+1, p_mean))
    print('Standardavvik plate {} = {:.3f}\n'.format(i+1, p_std))


k = np.array([997, 1002, 1001, 1001, 1001, 1000])
delta_t = np.asarray([23.77, 44.06, 116.34, 156.41, 326.76, 532.96])
n_r = k/delta_t

k_b = 211
delta_t_b = 600
n_b = k_b/delta_t_b

n = n_r - n_b
x = np.cumsum(means)
dx = np.cumsum(stds)

table_list = [["Antall blyplater", "Tykkelse, [mm]", "Usikkerhet tykkelse, [mm]", "n_r", "n"]]
for i in range(6):
    add = [str(i)]
    for size in [x[i], dx[i], n_r[i], n[i]]:
        add.append("{:.3f}".format(size))
    table_list.append(add)
tab = Table(table_list)
tab.write()

y = np.log(n)
coeffs, residuals, rank, singular_values, rcond = np.polyfit(x, y, deg=1, full=True)
slope, intercept = coeffs

# plt.style.use('seaborn')
# fig, ax = plt.subplots()
# ax.plot(x, y, 'o', label='Målepunkter')
# ax.plot(x, intercept + slope*x, label='Lineærtilpasning')
# ax.set_title('Absorpsjon i bly')
# ax.set_xlabel('Tykkelse bly, [mm]')
# ax.set_ylabel('ln(n)')
# fig.tight_layout()
# fig.savefig("figures/GM_bly.pdf")
