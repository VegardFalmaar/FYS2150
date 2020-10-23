load('data/grunnfrekvens.mat');
f = max(fw);

load('data/konstant_hastighet4.mat');

T = 20.2;
c = 331.1 + 0.606*T;
v = (1 - f./fw).*c;

fprintf('\n%d datapunkter, %0.4f sekunder/punkt\n',npunkter,dtid)
fprintf('frekvens oppløsning: %.2f Hz\n\n',dfrek)

START = 7;
END = 18;
% END = 23;

figure()
plot(tw(1:END), v(1:END), '-o');
hold on
xlabel('t [s]')
ylabel('v [m/s]')
hold off

const_vel = v(START:END);
const_f_m = fw(START:END);

f_m = mean(const_f_m);

fprintf('\nKonstant fart: %0.4f m/s, std-avvik %0.4f m/s\n', mean(const_vel), std(const_vel))
fprintf('f_m ved konst v: %.2f Hz,   std-avvik %0.4f m/s\n\n', f_m, std(const_f_m))

% Usikkerhet i farten
s_v = c*dfrek*sqrt( (1/f_m)^2 + (f/f_m^2)^2 )

% % Oppløsning fart
% fm = f - dfrek
% v = (1 - f./fm).*c
% 
% % Usikkerhet fart
% dv = v/2