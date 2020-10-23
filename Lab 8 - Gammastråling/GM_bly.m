x = [0 5.150 10.350 15.612 20.725 26.062]
n = [41.592 22.390 8.252 6.048 2.712 1.525]

fit = fitlm(x, log(n))

hold on
plot(fit)
title('Absorpsjon i bly')
xlabel('Tykkelse bly, [mm]')
ylabel('ln(n)')
hold on
