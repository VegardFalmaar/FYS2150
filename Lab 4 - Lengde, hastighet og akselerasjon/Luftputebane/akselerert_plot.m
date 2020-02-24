t = [1.82 1.80 2 1.93 1.95];

% Standard dev of the mean
std(t)/sqrt(length(t));

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

load('/home/vegard/Documents/FYS2150/Lab 4 - Lengde, hastighet og akselerasjon/Luftputebane/akselerert1.mat');
v = (1 - f./fw).*c;
stop = 10
fit = fitlm(tw(1:stop), v(1:stop))
figure(), plot(fit);
hold on
xlabel('t [s]')
ylabel('v [m/s]')
hold off