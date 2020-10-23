for i = 1:1:3
    filename = ['data/polarisering' string(i) '.dat'];
    filename = join(filename, '');
    data = importdata(filename);
    E_y = data(:, 1);
    E_z = data(:, 2);
    figure()
    hold on
    plot(E_y(1:500))
    plot(E_z(1:500))
    legend(['E_y'; 'E_z'])
    hold off
end