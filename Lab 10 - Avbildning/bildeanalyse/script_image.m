
filepath = '';

NUM_PICTURES = 10;

mean_values = zeros([1 NUM_PICTURES]);
variance = zeros('like', mean_values);

for i = 1:NUM_PICTURES
    filename = ['bilde_' string(i+5) '.bmp'];
    filename = join(filename, '');
    
    % Image analysis
    [m,v]=image_noise_analysis(filepath,filename);
    mean_values(i) = m;
    variance(i) = v/2;

%     fprintf('Image %s has been loaded\n', filename)
%     if i < NUM_PICTURES
%         fprintf('Press any key in the Command Window to continue\n\n')
%         pause;
%     end
end

disp('Uten siste punkt:')
fit = fitlm(mean_values(2:NUM_PICTURES), variance(2:NUM_PICTURES))

fprintf('\n\nMed siste punkt:\n')
fit = fitlm(mean_values, variance)

figure(4)
clf
hold on
% plot(mean_values, variance)
plot(fit)
title('Lineærtilpasning for støy mot intensitet')
xlabel('$\bar D$', 'Interpreter', 'latex')
ylabel('Var(D)', 'Interpreter', 'latex')
hold off

G = fit.Coefficients.Estimate(2)

figure(5)
clf
hold on
plot(mean_values, mean_values./sqrt(variance), 'DisplayName', '$\bar D / \sqrt{ Var(D) }$')
plot(mean_values, sqrt(mean_values./G), 'DisplayName', '$\sqrt{\bar D / G}$')
title('Middelverdi delt på støy')
xlabel('$\bar D$', 'Interpreter', 'latex')
ylabel('Verdi', 'Interpreter', 'latex')
legend('Interpreter', 'latex')
hold off










