% Script for å lage resultater til eksamen
% ved å bruke dataen fra laben

% f_name = 'data/bakgrunnsstøy.mat';
f_name = 'data/Vegard_synger.mat';
% f_name = 'data/grunnfrekvens.mat';

load(f_name);

% Copied from FFThastighet.m
fprintf('\n%d datapunkter, %0.4f sekunder/punkt\n', npunkter, dtid)
fprintf('frekvens oppløsning: %.2f Hz\n\n', dfrek)

% lukk figurer 1-3
if ishandle(1); close(1); end
if ishandle(2); close(2); end
if ishandle(3); close(3); end

% Plotter data
figure(1), plot(time,data), xlabel('tid, s'), ylabel('amplitude')

% Plott frekvensene som funksjon av tid
figure(2),plot(tw,fw,'o-'),xlabel('tid, s'),ylabel('frekvens, Hz')
% Plott ut Power-spekteret for intervall i (1<=i<=n)
i=1;
figure(3),plot(fut(2:end),power(i,2:end),'.-')
xlabel('frekvens, Hz')
ylabel('Energi')
