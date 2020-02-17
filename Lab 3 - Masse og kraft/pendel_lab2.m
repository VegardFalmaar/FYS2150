
tau = [43 35 36 36 38 37 37 37 47 47 41 41 40 42 44 39 41 37 39 36 35 40 35 39 40 38 48 42 38 40 42 40 37 42 42 39 46 42 37 41 32 46 41 38 40 40 36 46 41 40 43 40 41 41 41 39 40 40 43 39].*0.01;
n = length(tau);
mean_tau = mean(tau)

standard_deviation = std(tau) 
SE = standard_deviation/sqrt(n)

dtau = 2*SE;
dm = (2*dtau/mean_tau)

tau_ost = [41 46 39 46 42 43 41 44 42 44 43 43 43 46 42 43 44 39 42 46 35 50 43 43 43 48 42 44 43 41 43 41 44 44 42 45 41 43 42 43 38 38 36 44 41 46 47 42 40 46 44 42 42 44 44 43 44 43 42 43].*0.01;

for i = 1:1:20
    fprintf('%f   ', tau_ost(i));
    fprintf('%f   ', tau_ost(20+i));
    fprintf('%f   ', tau_ost(40+i));
    disp(' ')
end

n = length(tau_ost)
mean_tau_ost = mean(tau_ost)

standard_deviation = std(tau_ost) 
SE = standard_deviation/sqrt(n)

dtau_ost = 2*SE;

m0 = 2
m1 = ((mean_tau_ost/mean_tau)^2-1)*m0

dm = (2*dtau_ost/mean_tau_ost)*(m0 + m1)
