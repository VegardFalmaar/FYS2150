Cs_file = 'data/Cs137.txt';
Na_file = 'data/Na22.txt';

Cs = fopen(Cs_file, 'r');
Cs_data = fscanf(Cs, '%d', [2 1024]);
I_Cs = Cs_data(1, :);
E_Cs = Cs_data(2, :);

Na = fopen(Na_file, 'r');
Na_data = fscanf(Na, '%d', [2 1024]);
I_Na = Na_data(1, :);
E_Na = Na_data(2, :);

E_Cs_smooth = smooth(E_Cs, 10);
E_Na_smooth = smooth(E_Na, 10);


% Find the top for Cs
start = 378; % Estimated from the plot
stop = 527;
[x, background, I_max_Cs] = remove_background(start, stop, I_Cs, E_Cs_smooth, 'Cs top');

figure()
hold on
plot(I_Cs, E_Cs)
plot(I_Cs, E_Cs_smooth)
plot(x+start, background, 'r')
legend('Raw', 'Smooth', 'Background')
title('Cs')
hold off



% Find the highest top for Na (beta top)
start_beta = 317;
stop = 415;
[x_beta, background_beta, I_max_Na_beta] = remove_background(start_beta, stop, I_Na, E_Na_smooth, 'Na beta top');

% Find the other top for Na
start = 820;
stop = 970;
[x, background, I_max_Na] = remove_background(start, stop, I_Na, E_Na_smooth, 'Na top');

figure()
hold on
plot(I_Na, E_Na)
plot(I_Na, E_Na_smooth)
plot(x_beta+start_beta, background_beta, 'r')
plot(x+start, background, 'r')
legend('Raw', 'Smooth', 'Background')
title('Na')
hold off

disp('For Cs, topp i kanal')
disp(I_max_Cs)
disp('For Na, beta-topp i kanal')
disp(I_max_Na_beta)
disp('For Cs, topp i kanal')
disp(I_max_Na)

DeltaE = 1.47
E_0 = -40.67
disp('With this calibration, the 511 keV top has value')
disp(DeltaE*I_max_Na_beta + E_0)


function [x, background, I_max] = remove_background(start, stop, I, E, plot_title)
slope = (E(stop) - E(start))/(stop - start);
x = linspace(0, stop-start, stop-start+1);
x = transpose(x);
background = E(start) + slope*x;

top = E(start:stop) - background;
figure()
hold on
plot(top)
title(plot_title)
hold off

top_val = max(top);
idx_top = start + find(top == top_val);
I_max = I(idx_top);
end
















