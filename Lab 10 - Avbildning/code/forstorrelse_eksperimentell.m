function [M, s_M] = forstorrelse_eksperimentell(D_objekt, D_bilde, s_D_objekt, s_D_bilde)
M_array = - D_bilde./D_objekt;
N = length(M_array);
s_M_array = M_array.*sqrt((s_D_bilde./D_bilde).^2 + (s_D_objekt./D_objekt).^2);
for i = 1:N
    if abs(M_array(i)) < 1
        M_old = M_array(i);
        M_new = 1/M_old;
        M_array(i) = M_new;
        s_M_array(i) = M_new/M_old*s_M_array(i);
    end
end
M = mean(M_array);
s_M = 1/sqrt(N)*sqrt(sum((s_M_array).^2));
end
