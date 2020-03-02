load('LavpassRC_sorted.mat')
db = reg.Coefficients.SE(1)
omega0 = 10^b
domega0 = log(10)*omega0*db
R = 10000;
dR = 150;
C = 1/R/omega0
dC = C*sqrt((dR/R)^2 + (domega0/omega0)^2)