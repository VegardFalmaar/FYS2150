function [f] = relfactor(U)
f = 1./sqrt(1 + U.*1E-3/(2*0.511));
end

