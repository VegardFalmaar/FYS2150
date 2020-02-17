<<<<<<< HEAD
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
=======
 mass = [0.01, 0.1, 0.11, 0.5, 1, 1.01, 2, 2.01]; 
 
 length = [16, 39, 43, 185, 375, 383, 740, 745];
 
 scatter(mass, length)

xlabel("masse [kg]")
ylabel("utslag [mm]")
>>>>>>> 47005446b8d9060212d38435064d34742ca14f4a
