masser = [10 100 110 500 1000 1010 2000 2010];
utslag = [16 39 43 185 375 383 740 745];

fit = fitlm(masser(1:6), utslag(1:6))

hold on
plot(masser, utslag, 'o')
plot(fit)
hold off

coeffs = fit.Coefficients.Estimate;
a = coeffs(2)
b = coeffs(1)

m = (utslag(7) - b)/a
dm = sqrt((5/a)^2 + (3.1937/a)^2 + (m*0.005167/a)^2)

m = (utslag(8) - b)/a
dm = sqrt((5/a)^2 + (3.1937/a)^2 + (m*0.005167/a)^2)