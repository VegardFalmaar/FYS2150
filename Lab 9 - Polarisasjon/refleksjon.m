polarizations = {'s', 'p'};
for idx = 1:length(polarizations)
    letter = polarizations{idx};
    filename = ['data/' letter '_polarisert_refleksjon.xlsx'];
    filename = join(filename, '');
    data = xlsread(filename);
    phi = data(:, 1);
    phi = phi + pi/4; % Correct for angular offset
    I = data(:, 2);
    
    
    figure()
    hold on
    degrees = phi.*180./pi;
    plot(degrees, I, 'DisplayName', 'Experimental data')
    if letter == 'p'
        idx = find(I == min(I));
        min_degrees = degrees(idx);
        disp('p-polarization minimum')
        disp(mean(min_degrees))
        disp((min_degrees(end) - min_degrees(1))/2)
        plot(phi(idx).*180./pi, I(idx), 'DisplayName', 'Minimum')
    end
    title(join(['Relativ lysintensitet ' letter '-polarisert lys'], ''))
    xlabel('$\phi$, [$^\circ$]', 'Interpreter', 'latex')
    ylabel('Relativ lysintensitet, [\%]', 'Interpreter', 'latex')
    legend('Interpreter', 'latex')
    hold off
end