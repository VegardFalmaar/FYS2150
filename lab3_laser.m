masser = [0 10 100 110 500 1000 1010 2000 2010];
utslag = [0 6 39 43 185 375 383 740 745];

% fit = fitlm(masser(1:7), utslag(1:7));
fit = fitlm(masser, utslag);

hold on
plot(masser, utslag, 'o')
plot(fit)
hold off

coeffs = fit.Coefficients.Estimate;
a = coeffs(2)
b = coeffs(1)
Errors = fit.Coefficients.SE
da = 2*Errors(2)
db = 2*Errors(1);

m = (utslag(8) - b)/a
dm = sqrt((5/a)^2 + (db/a)^2 + (m*da/a)^2)

m = (utslag(9) - b)/a
dm = sqrt((5/a)^2 + (db/a)^2 + (m*da/a)^2)

m = (380 - b)/a
dm = sqrt((3/a)^2 + (db/a)^2 + (m*da/a)^2)

% fit = fitlm(masser, utslag);
m = (760 - b)/a
dm = sqrt((5/a)^2 + (db/a)^2 + (m*da/a)^2)

% fit = fitlm(masser(1:4), utslag(1:4));
m = (40 - b)/a
dm = sqrt((1/a)^2 + (db/a)^2 + (m*da/a)^2)

m = (190 - b)/a
dm = sqrt((2/a)^2 + (db/a)^2 + (m*da/a)^2)

dA = 4e-6;
dm1 = dA*100


