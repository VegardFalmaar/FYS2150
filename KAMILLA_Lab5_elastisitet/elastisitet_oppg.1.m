m1 = 500.2;
m2 = 1000.6;
m3 = 2001.2;

m = [0 m1 m2 m1+m2 m3 m3+m1 m3+m2 m1+m2+m3];
h = [0.00 0.63 1.46 2.20 2.94 3.68 4.42 5.16];

fitlm(m,h)




