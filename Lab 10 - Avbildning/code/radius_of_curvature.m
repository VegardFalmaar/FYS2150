function [R, s_R] = radius_of_curvature(x, d, s_d)
R = (x^2 + d^2)/(2*d);
s_R = abs((-x^2/(2*d^2)+1/2)*s_d);
end

