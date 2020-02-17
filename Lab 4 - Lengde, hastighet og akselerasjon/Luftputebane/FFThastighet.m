% Ta opp lydsignal og beregn lydens frekvens som funksjon av tid

%Akvisisjonparametre
duration=3; %[s] akvisisjontid
samplerate=96000; % akvisisjonsfrekvens (sampling frequency)

%Parametre for analysen
fmin=10000; %Velg en frekvens litt (>500Hz lavere) under frekvensen målt i ro
wp2=14; %Antall sample i hvert tidsvindu blir 2.^wp2

% Fortell hvor mange datapunkter (frekvensmålinger) det blir,
% hvor mye tid hvert datapunkt dekker, og hva slags frekvensoppløsning
% dette gir.

npunkter = floor(duration*samplerate/2^wp2);
dtid = duration/npunkter;
dfrek = 1/dtid;

fprintf('\n%d datapunkter, %0.4f sekunder/punkt\n',npunkter,dtid)
fprintf('frekvens oppløsning: %.2f Hz\n\n',dfrek)

% luk figurer 1-3
if ishandle(1); close(1); end
if ishandle(2); close(2); end
if ishandle(3); close(3); end

%Gjør klar og samle inn data
[DS,devicename]=initDaqSession(duration,samplerate,1);
disp('DAQ session started')
addAudioInputChannel(DS,devicename, 1);
fprintf('Datainnsamling starter...\n')
[data, time] = startForeground(DS);
figure(1), plot(time,data), xlabel('tid, s'), ylabel('amplitude')

%Gjør FFT på tidsvinduer
[tw,fw,n,fut,power]=stykkevisFFT(time,data,wp2,fmin);
%Plott frekvensene som funksjon av tid
figure(2),plot(tw,fw,'o-'),xlabel('tid, s'),ylabel('frekvens, Hz')
%Plott ut Power-spekteret for intervall i (1<=i<=n)
i=1;
figure(3),plot(fut(2:end),power(i,2:end),'.-')
xlabel('frekvens, Hz')
ylabel('Energi')
%Lag din egen funksjon v(fw) og plott
%figure(3), plot(tw,v)

filename = input('Hvilket filnavn vil du bruke for å lagre dataene?','s');

clear DS;
save(filename);

