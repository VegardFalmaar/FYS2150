function [f] = focal_length(R)
lambda = 520*1E-3; % micrometers
n = refractive_index(lambda);
f = R/(2*(n-1));
end

