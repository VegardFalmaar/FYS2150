function [M,s_M] = forstorrelse_teoretisk(s, c, s_s, s_c)
M_array = 1 - c./s;
N = length(M_array);
s_M_array = sqrt(((-1./s).*s_c).^2 + (c./s.^2.*s_s).^2);
for i = 1:N
    if abs(M_array(i)) < 1
        M_old = M_array(i);
        M_new = 1/M_old;
        M_array(i) = M_new;
        s_M_array(i) = M_new/M_old*s_M_array(i);
    end
end
M = mean(M_array);
s_M = 1/sqrt(N)*sqrt(sum(s_M_array.^2));
end
