mu_0 = 4*pi*1E-7; % T m / A
I = 5; % A
N = 244;
L = 274E-3; % m

B_0 = mu_0*N*I/L; % T
fprintf('\nTheoretical B: %.2f mT\n', B_0*1E3)

% Ellipsoids
names = ["Short cylinder", "Sphere", "Tall cylinder", "Spear"];
measurements = ["Parallel", 'Perpendicular'];

a = [59.90 0.0 64.64 207       % Parallel, mm
      6.88 0.0  9.98 10.00];   % Normal, mm
  
B_0_arr = [4.9 4.8 5.0 4.5     % Parallel, mT
           5.3 4.8 5.2 0.0];   % Normal, mT
       
B_arr = [16.8 15.3 19.6 53.3   % Parallel, mT
          5.4 11.7  7.6  0.0]; % Normal, mT
      
chi = 200000; % Susceptibility of iron

header_format = '\n%-15s | %-13s | %-7s | %-7s | %-7s | %-7s | \n';
data_format = '%-15s | %-13s | %-7.3f | %-7.3f | %-7.3f | %-7.3f | \n';

fprintf(header_format, 'Shape', 'Measurement', 'D', 'B_0', 'B', 'B_0/D')
fprintf('-------------------------------------------------------------------------\n')

for i = 1:4
    if i == 2 % Sphere
        f = 1; % Approximately
    else
        f = a(1, i)/a(2, i);
    end
    [D_parallel, D_normal] = de_mag_factor(f);
    D_arr = [D_parallel D_normal];
    for j = 1:2
        if ~ (i == 4 && j == 2)
            B_0 = B_0_arr(j, i);
            B = B_arr(j, i);
            D = D_arr(j);
            theoretical = B_0*(1 + chi)/(1 + chi*D);
            fprintf(data_format, ...
                names(i), measurements(j), D, B_0, B, B_0/D)
        end
    end
end














