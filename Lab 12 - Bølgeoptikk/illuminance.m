function [illuminance] = illuminance(x, R, a, N, A)
%Illuminans i diffraksjonsmønster
%   Returner illuminansen i diffraksjonsmønsteret
%   som funksjon av x , R , a , N og A (se 
%   øvelsesteksten for definisjoner) for 1 eller 
%   flere spalter og laserlys med bølgelengde 
%   632.8 nm (He-Ne lasertype).
%   Normalisering/skalering av illuminansen: 
%   det største maksimum får illuminans 1.0

lambda = 632.8E-9;      % nm
c = pi/lambda/R;
first = sinc(a*c*x/pi);
if N > 1
    second = sinc(N*A*c*x/pi);
else
    second = 1;
end
illuminance = first.^2 .* second.^2;
end

