L = 1.445;
dL = 0.002;
d = 0.01605;
dd = 0.00001;
M = 2.4472;
dM = 0.0001;
E1 = 104.2E9
dE1 = 0.7E9;
f = sqrt(E1*pi*d^2/(16*M*L));

f = 1213.4;
df = 0.2;
E2 = 16*M*L*f^2/(pi*d^2)
dE2 = E2*sqrt((2*dd/d)^2 + (2*df/f)^2 + (dL/L)^2 + (dM/M)^2);

D = E1 - E2
sD = sqrt(dE1^2 + dE2^2)