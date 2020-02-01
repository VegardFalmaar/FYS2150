load('RC_data.mat')
x = frekvens(1, 12:20);
y = Vu_over_Vi(1, 12:20);
fit = fitlm(log10(x), log10(y));

disp('The coefficients are:')
coeffs = fit.Coefficients.Estimate;
intercept = coeffs(1)
slope = coeffs(2)

%omega0s = (1./sqrt(exp(-2.*(intercept + slope.*log10(x))) - 1)).*x
disp('Antar stor omega slik at slope er ca lik -1 og log(omega0) = intercept')
omega0 = 10^intercept

hold on
plot(log10(frekvens), log10(Vu_over_Vi), 'o')
plot(fit)
plot(log10(x), -0.5.*log10(1 + (x./omega0).^2), 'DisplayName', 'Theoretical')
hold off
