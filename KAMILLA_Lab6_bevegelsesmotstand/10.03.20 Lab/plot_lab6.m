d_sk = data(1:10,1);
v_sk = data(1:10,2);
se_sk = data(1:10,3);

d_p = data(1:4,5);
v_p = data(1:4,6);
se_p = data(1:4,7);

d_i = data(1:10,9);
v_i = data(1:10,10);
se_i = data(1:10,11);


d_smk = data(:,13);
v_smk = data(:,14);
se_smk = data(:,15);


% hold on
% plot(log(d_sk), log(v_sk), "o")
% plot(log(d_p), log(v_p), "o")
% plot(log(d_i), log(v_i), "o")
% %plot(log(d_smk), log(v_smk), "o")
% legend("store stålkuler i olje", "plast i vann", "isopor i luft", "små stålkuler i olje")
% hold off

hold on
errorbar(log(d_sk), log(v_sk), (se_sk./v_sk), "o")
errorbar(log(d_p), log(v_p), (se_p./v_p), "o")
errorbar(log(d_i), log(v_i), (se_i./v_i), "o")
errorbar(log(d_smk), log(v_smk), (se_smk./v_smk), "o")
legend("store stålkuler i olje", "plast i vann", "isopor i luft", "små stålkuler i olje")
hold off


p_fit = fitlm(log(d_p), log(v_p))
i_fit = fitlm(log(d_i), log(v_i))
sk_fit = fitlm(log(d_sk(1:4)), log(v_sk(1:4)))
smk_fit = fitlm(log(d_smk(1:3)), log(v_smk(1:3)))

log(d_i)
log(v_i)

hold on
plot(p_fit)
plot(i_fit)
plot(sk_fit)
plot(smk_fit)
legend("store stålkuler i olje", "plast i vann", "isopor i luft", "små stålkuler i olje")
xlabel("log(diameter)")
ylabel("log(fart)")
hold off 