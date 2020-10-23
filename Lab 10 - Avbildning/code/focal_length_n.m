function [f, s_f] = focal_length_n(R, lambda, s_R)
n = refractive_index(lambda);
f = R/(2*(n-1));
s_f = f*s_R/R;
end
