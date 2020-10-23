function [f, s_f_sum] = focal_length_s(s, c, s_s, s_c)
f_array = s - s.^2./c;
N = length(f_array);
f = mean(f_array);
s_f = sqrt(((1 - 2.*s./c).*s_s).^2+  (s.^2./c.^2.*s_c).^2);
s_f_sum = 1/sqrt(N)*sqrt(sum(s_f.^2));
end