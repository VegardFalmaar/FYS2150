t = [1.82 1.80 2 1.93 1.95];

t_mean = mean(t)
% Standard dev of the mean
SE_t = std(t)/sqrt(length(t))

load('grunnfrekvens.mat');
f = max(fw);

T = 20.2;
c = 331.1 + 0.606*T;

% for i=1:4
%     num = num2str(i);
%     list = ['/home/vegard/Documents/FYS2150/Lab 4 - Lengde, hastighet og akselerasjon/Luftputebane/akselerert' num '.mat'];
%     filename = join(list)
%     load(filename);
% 
%     v = (1 - f./fw).*c;
%     length(tw)
%     figure(), plot(tw(1:15), v(1:15));
%     hold on
%     xlabel('t [s]')
%     ylabel('v [m/s]')
%     hold off
% end

load('data/akselerert1.mat');
% load('/home/vegard/Documents/FYS2150/Lab 4 - Lengde, hastighet og akselerasjon/Luftputebane/K og co/aks2_2.mat')
% load('/home/vegard/Documents/FYS2150/Lab 4 - Lengde, hastighet og akselerasjon/Luftputebane/K og co/aks1_1.mat')
% load('/home/vegard/Documents/FYS2150/Lab 4 - Lengde, hastighet og akselerasjon/Luftputebane/K og co/aks3_1.mat')

v = (1 - f./fw).*c;
% stop = 15
% stop = length(tw)
stop = 10;
fit = fitlm(tw(1:stop), v(1:stop))
figure(), plot(fit);
hold on
title('Lineærtilpasning akselerasjon skråplan')
xlabel('$t$, [s]', 'Interpreter', 'latex')
ylabel('$v$, [m/s]', 'Interpreter', 'latex')
hold off

