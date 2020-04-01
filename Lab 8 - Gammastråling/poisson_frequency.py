from format import Table
import numpy as np
import matplotlib.pyplot as plt

def bins(l):
    mydict = {}
    for e in l:
        if e in mydict:
            mydict[e] += 1
        else:
            mydict[e] = 1
    return mydict

counts = [5, 6, 2, 3, 3, 3, 6, 1, 5, 5,
        2, 4, 6, 1, 6, 8, 4, 2, 4, 2,
        6, 1, 7, 4, 4, 8, 4, 2, 4, 2,
        4, 1, 2, 1, 2, 4, 3, 0, 6, 3,
        4, 6, 7, 5, 0, 7, 5, 3, 6, 0,
        1, 7, 0, 6, 3, 2, 7, 8, 9, 2,
        4, 3, 6, 7, 2, 8, 3, 6, 6, 5,
        7, 8, 5, 4, 1, 0, 2, 5, 7, 3,
        4, 1, 3, 6, 13, 7, 2, 1, 6, 5,
        9, 5, 3, 3, 3, 5, 3, 4, 4, 6]
counts.sort()


### Oppgave 1.1
count_dict = bins(counts)
l = [['Tellinger, k', 'Frekvens']]
for key, val in count_dict.items():
    l.append([str(key), str(val)])

tab = Table(l)
tab.write(filename='poisson_frequency_table.txt')


### Oppgave 1.2
k = np.arange(0, max(count_dict.keys()) + 1)
counts = np.asarray(counts)

plt.style.use('seaborn')
plt.rc('text', usetex=True)

fig, ax = plt.subplots()
ax.hist(counts, bins=k, label='Observasjoner')
ax.set_xticks(k)
ax.set_title('Tellinger per sekund', fontsize=20)
ax.set_xlabel('Tellinger, k', fontsize=20)
ax.set_ylabel('Frekvens', fontsize=20)


### Oppgave 1.3
N = len(counts)
k_mean = 1/N*np.sum(counts)
print(f'k_mean = {k_mean}')
s = np.sqrt(1/(N - 1)*np.sum((counts - k_mean)**2))
print('s = {:.2f}'.format(s))
print('sqrt(k_mean) = {:.2f}'.format(np.sqrt(k_mean)))
print('Ratio = s/sqrt(k_mean) = {:.3f}'.format(s/np.sqrt(k_mean)))


### Oppgave 1.4
theoretical = [N*np.exp(-k_mean)]
for i in k[1:]:
    theoretical.append(k_mean/i*theoretical[i-1])

ax.plot(k, theoretical, label='Teoretisk')
fig.legend(fontsize=15)
fig.tight_layout()
fig.savefig('figures/poisson_frequency.pdf')
