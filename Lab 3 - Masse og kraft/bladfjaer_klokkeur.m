hanske = 3.09;
ingenting = 3.11;
masser = [0 10 100 500 1500 1000 2000 600 700 1700];
utslag = [3.09 3.07 2.95 2.36 0.92 1.64 0.21 2.20 2.08 0.63] - hanske;
[k, dk] = linearmodel(masser, utslag)
plot(masser, utslag, 'o')

U = -0.04 - ingenting;
dU = 0.006;
m = U/k
dm = m*sqrt((dU/U)^2 + (dk/k)^2)

U = -0.08 - hanske;
dU = 0.006;
m = U/k
dm = m*sqrt((dU/U)^2 + (dk/k)^2)