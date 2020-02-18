 mass = [0.01, 0.1, 0.11, 0.5, 1, 1.01, 2, 2.01]; 
 
 length = [16, 39, 43, 185, 375, 383, 740, 745];
 
 scatter(mass, length)
 
function [A,deltaA] = linearmodel(x,y)
%linearmodel Find the slope and uncertainty of a linear model fitting to
%data points x and y given as input parameters
n = length(x);
D = sum(x.*x) - 1/n*sum(x)^2;
E = sum(x.*y) - 1/n*sum(x)*sum(y);
F = sum(y.*y) - 1/n*sum(y)^2;
A = E/D;
deltaA = sqrt(1/(n - 2)*(D*F - E^2)/D^2);
end 

linearmodel(mass,length)