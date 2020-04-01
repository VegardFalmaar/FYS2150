from format import Table

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

def bins(l):
    mydict = {}
    for e in l:
        if e in mydict:
            mydict[e] += 1
        else:
            mydict[e] = 1
    return mydict

count_dict = bins(counts)
l = [['Tellinger, k', 'Frekvens']]
for key, val in count_dict.items():
    l.append([str(key), str(val)])

tab = Table(l)
tab.write(filename='poisson_frequency_table.txt')
