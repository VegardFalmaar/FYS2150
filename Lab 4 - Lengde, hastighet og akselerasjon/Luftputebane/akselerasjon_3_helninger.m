
s = 2031E-3;
ds = 2E-3 % skal det være E-3??? Satt på i dag

% Helning 2
tid = [1.93 2.07 2.49];
t = mean(tid);
stddev = std(tid)/length(tid);
a2 = 2*s/t^2;
da2 = a2*sqrt((ds/s)^2 + (2*stddev/t)^2);

% Helning 1 (3 hos oss, 1 hos Kamilla)
tid = [2.89 2.84 2.82];
t = mean(tid);
stddev = std(tid)/length(tid)
a3 = 2*s/t^2;
da3 = a3*sqrt((ds/s)^2 + (2*stddev/t)^2);

theoretical = [0.80 0.450 0.256];
a_v = [0.86 0.69 0.44];
a_v_error = [0.03 0.02 0.02];
a_t = [1.05 a2 a3];
a_t_error = [0.09 da2 da3];

hold on
plot(theoretical, theoretical, 'k:')
errorbar(theoretical, a_v, a_v_error)
errorbar(theoretical, a_t, a_t_error)
legend('$a_{teoretisk}$', '$a_v$', '$a_t$', 'Interpreter', 'latex')
title('Akselerasjon teoretisk, ved Doppler og ved stoppeklokke')
xlabel('$a_{teoretisk}$ [m/s]', 'Interpreter', 'latex')
ylabel('$a$, [m/s]', 'Interpreter', 'latex')
hold off