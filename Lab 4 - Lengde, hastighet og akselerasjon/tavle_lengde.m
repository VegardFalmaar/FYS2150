l = [0.52 0.5 0.3 0.45 0.59 0.2 0.38 0.5 0.3]
s = [0.09 0.2 1.5 0.07 0.04 1.8 0.04 0.3 0.3]
lp = 0
s_p = 0 
len = length(l) 
for i=1:len
    lp = lp + l(i)/(s(i)*s(i));
    s_p = s_p + 1/(s(i)*s(i));
end 

lp = lp/s_p ;
s_p = sqrt(1/s_p);
disp(lp)
disp(s_p)
