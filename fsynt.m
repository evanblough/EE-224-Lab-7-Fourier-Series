% Lab 4 of EE 224
% synthesize a waveform based on the Fourier coefficients

function x=fsynt(C, T, Ts)

% INPUT: C  - a column vector containing the coefficients for the zero
%            frequency and positive frequencies
%        T  - The total time duration. The time is from 0 to T
%        Ts - Sampling period. Generate one sample every Ts second
%
% OUTPUT: x - The synthesized output signal, one sample every Ts second.

len = T / Ts;
omega = 2*pi/T;
if(rem(round(len), 1) == 0)
    
    
else
    x = 0;
    return;
end 
Ck = C(2:length(C));
CC = cat(1, conj(flipud(Ck)), C);
display(CC);
F = 0;
for ii = 1:length(CC)
    
    N = 0:len;
    
    display((-1*round(length(CC)/2)+ii));
    display(CC(ii));
    F = F + exp(N*Ts*(-1*round(length(CC)/2)+ii)*omega*1i)*CC(ii);
    
    
    
    
end
x = F;

