
filepath='Users/kamilla/Documents/FYS2150/Lab 10 - Avbildning/bildeanalyse/';

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

fit = fitlm(mean_values, variance)

figure(4)
hold on
% plot(mean_values, variance_values)
plot(fit)
title('Lineærtilpasning for støy mot intensitet')
xlabel('$\overline D$', 'Interpreter', 'latex')
ylabel('Var(D)', 'Interpreter', 'latex')
hold off

figure(5)
hold on
plot(mean_values, mean_values./variance)
title('Lineærtilpasning for støy mot intensitet')
xlabel('$\overline D$', 'Interpreter', 'latex')
ylabel('$\overline D/Var(D)$', 'Interpreter', 'latex')
hold off










