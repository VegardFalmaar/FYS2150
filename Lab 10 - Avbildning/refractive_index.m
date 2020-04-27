function [n] = refractive_index(lambda)
%refractive_index 
%     Calculate the refractive index for N-BK7 glass 
%     for given wavelength in micrometers
B1 = 1.03961212;
B2 = 0.231792344;
B3 = 1.01046945;
C1 = 0.00600069867;
C2 = 0.0200179144;
C3 = 103.560653;
n = sqrt(B1*lambda^2/(lambda^2-C1)+B2*lambda^2/(lambda^2-C2)+ B3*lambda^2/(lambda^2-C3)+1);
end


