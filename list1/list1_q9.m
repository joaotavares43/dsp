%Using Welford algorithm
clear all;
close all;
clc;
%def welford(x_array):
%    k = 0 
%    M = 0
%    S = 0
%    for x in x_array:
%        k += 1
%        Mnext = M + (x - M) / k
%        S = S + (x - M)*(x - Mnext)
%        M = Mnext
%    return (M, S/(k-1))

%for A in [1e7, -1e7]:
%    y1b = y1 - 1 + A
%    print "welford:", welford(y1b)
%    print "numpy:   ", (np.mean(y1b), np.var(y1b, ddof=1))

function variance = welford(samples)
    k = 0;
    M = 0;
    S = 0;
    for index = 1:size(samples,1)
        k += 1;
        x = samples(index);        
        Mnext = M + (x - M) / k;
        S = S + (x - M)*(x - Mnext);
        M = Mnext;
    end
    variance = S/(k-1);
end


samples = 100*rand(5,1);
variance = welford(samples)
matlab_variance = var(samples,0,1)

