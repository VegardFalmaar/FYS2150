mu_0 = 4*pi*1E-7; % Tm/A
k = 1.18E-6;         % WB
D = 10;      

N_pri = 344;
N_sek = 130;

d = 6.5*1E-3;    % m
L = 315*1E-3;    % m
A = pi*(d/2)^2;      % m

    
S_min = [-330.41 -407.85 -526.59 -831.18 -1001.55 -1058.34 -1104.80 -1419.72];
     
S_max = [-175.53 -72.28 30.98 -92.93 -118.74 -61.95 -20.65 -268.45];

I_array = [(1.03+1.23)/2 (1.51+1.78)/2 (2.05+2.33)/2 (2.60+2.88)/2 ...
           (3.08+3.36)/2 (3.56+3.90)/2 (4.18+4.38)/2 (4.66+5.00)/2]; % A

B_array = zeros(1, 8);
H_array = zeros(1, 8);
M_array = zeros(1, 8); 

for i = 1:8
    B_array(i) = k*D*(S_max(i) - S_min(i))/(2*N_sek*A);
    H_array(i) = N_pri*I_array(i)/L;
    M_array(i) = B_array(i)/mu_0 - H_array(i);
end

figure(1)
plot(I_array, B_array)
hold on
title('$B(I)$', 'Interpreter', 'latex')
xlabel('$I$, [A]', 'Interpreter', 'latex')
ylabel('$B$, [T]', 'Interpreter', 'latex')
hold on

figure(2)
plot(H_array, M_array)
hold on
title('$M(H_0)$', 'Interpreter', 'latex')
xlabel('$H_0$, [A/m]', 'Interpreter', 'latex')
ylabel('$M$, [A/m]', 'Interpreter', 'latex')
hold on
