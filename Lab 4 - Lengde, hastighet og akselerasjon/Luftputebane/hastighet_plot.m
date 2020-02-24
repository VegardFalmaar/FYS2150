load('grunnfrekvens.mat');
f = max(fw);

load('konstant_hastighet4.mat');

T = 20.2;
c = 331.1 + 0.606*T;
v = (1 - f./fw).*c;
length(tw)
plot(tw(1:15), v(1:15));
hold on
xlabel('t [s]')
ylabel('v [m/s]')
hold off

% Oppløsning fart
fm = f - dfrek
v = (1 - f./fm).*c

% Usikkerhet fart
dv = v/2