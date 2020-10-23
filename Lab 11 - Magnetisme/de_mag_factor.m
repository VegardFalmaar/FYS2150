function [D_parallel, D_normal] = de_mag_factor(f)
if f > 1
    frac1 = 1/(1 - f^2);
    root = sqrt(f^2 - 1);
    frac2 = f/root;
    in_log = f + root;
    D_parallel = frac1*(1 - frac2*log(f + root));
elseif f == 1
    D_parallel = 1/3;
else
    frac1 = 1/(1 - f^2);
    D_parallel = frac1*(1 - f/sqrt(1 - f^2)*acos(f));
end
D_normal = (1 - D_parallel)./2;
end
