B_arr = [520 533        % [T], 3 A
         677 694]*1E-3; % [T], 4 A
d_minus = [5.4 6.8 9.1  % 3 A
           4.7 6.3 8.3];% 4 A
d_plus = [6.1 7.3 9.5   % 3 A
          5.4 6.8 8.8]; % 4 A

mu_B_minus = zeros(1, 2);
mu_B_plus = zeros(1, 2);
delta_nu_minus = zeros(1, 2);
delta_nu_plus = zeros(1, 2);
        
for i = 1:2 % 3 A and 4 A
    % minus
    B = B_arr(i, 1);
    d_1 = d_minus(i, 1);
    d_2 = d_minus(i, 2);
    d_3 = d_minus(i, 3);
    [delta_nu, mu_B] = zeeman2(d_1, d_2, d_3, B);
    mu_B_minus(i) = mu_B;
    delta_nu_minus(i) = delta_nu;
    
    % plus
    B = B_arr(i, 2);
    d_1 = d_plus(i, 1);
    d_2 = d_plus(i, 2);
    d_3 = d_plus(i, 3);
    [delta_nu, mu_B] = zeeman2(d_1, d_2, d_3, B);
    mu_B_plus(i) = mu_B;
    delta_nu_plus(i) = delta_nu;
end

mu_B_arr = 0.5*(mu_B_minus + mu_B_plus);
mu_B = mean(mu_B_arr)
s_mu_B = std(mu_B_arr)/sqrt(length(mu_B_arr))
relative = s_mu_B/mu_B

delta_nu_arr = 0.5*(delta_nu_minus + delta_nu_plus);
delta_nu = mean(delta_nu)
s_delta_mu = std(delta_nu_arr)/sqrt(length(delta_nu_arr))