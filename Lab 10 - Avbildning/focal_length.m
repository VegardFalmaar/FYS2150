function [f] = focal_length(R)
lambda = 520; % nm
n = refractive_index(lambda);
f = R/(2*(n-1));
end

