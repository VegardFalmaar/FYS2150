filename = 'data/klokke.txt';
file = fopen(filename, 'r');
data = fscanf(file, '%d', [2 1024]);

I = data(1, :);
intensity = data(2, :);
intensity = transpose(intensity);
intentity = smooth(intensity, 10);

DeltaE = 1.47
E_0 = -40.67

list = [396 496;
        232 281;
        194 231;
        159 194;
        120 154;
        34 80];

figure()
plot(I, intensity)
hold on
for i = 1:1:6
    start = list(i, 1);
    stop = list(i, 2);

    [x, background, I_max] = remove_background(start, stop, I, intensity, 'Last top');

    plot(x+start, background)
    
    E = DeltaE*I_max + E_0;
    disp('We have a maximum at')
    fprintf('\n\tI = %d --> E = %.2f keV\n\n', I_max, E)
end
legend('Måling', 'Po-214', 'Bi-214 (4)', 'Bi-214 (3)', 'Bi-214 (2)', 'Rn-222', 'Bi-214 (1)')
hold off