hanske = 3.09;
ingenting = 3.11;
masser = [0 10 100 500 600 700 1000 1500  1700 2000];
utslag = [3.09 3.07 2.95 2.36 2.20 2.08 1.64 0.92 0.63 0.21] - hanske;
[k, dk] = linearmodel(masser, utslag)
plot(masser, utslag, 'o', masser, k.*masser)
xlabel("masse [g]")
ylabel("utslag [mm]")
legend("måledata", "lineærtilpasning")

U = 0.5 - hanske
dU = 0.005;
m = U/k
dm = m*sqrt((dU/U)^2 + (dk/k)^2)


U = -0.04 - ingenting;
dU = 0.006;
m = U/k
dm = m*sqrt((dU/U)^2 + (dk/k)^2)

U = -0.08 - hanske;
dU = 0.006;
m = U/k
dm = m*sqrt((dU/U)^2 + (dk/k)^2)