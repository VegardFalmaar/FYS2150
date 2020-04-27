lambda = 520; % nm
lambda = lambda*1E-3; % micrometers
n = refractive_index(lambda)

x1 = 33/2;    %mm
d1 = 0.4;     %mm

x2 = 22/2;    %mm
d2 = 0.3;     %mm

R1 = radius_of_curvature(x1, d1)
R2 = radius_of_curvature(x2, d2)

R1 = 297      %mm
R2 = 259      %mm

f1 = focal_length(R1)
f2 = focal_length(R2)

