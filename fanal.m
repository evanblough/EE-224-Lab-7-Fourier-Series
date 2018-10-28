function [a_k]= fanal(x_T,kmax,T,T_s)
% fanal estimates the first k Fourier coefficients from a period of the
% signal sampled at T_s. As T_s gets smaller relative to T, the estimate improves.
% Updated by Julie A Dickerson, September 2014
% .




% Inputs
%   x_T one period of signal sampled at T_s, must be a row vector
%   kmax : the highes value of coefficient to compute.
%   T period of signal
%   T_s sampling period

% Output:
%   a_k = vector of first k coefficients for the signal, only positive
%   coefficients will be generated.from k=0 to kmax
%
%   Usage
%   w0 = 2*pi/T; 
%   x_T = 2*cos(w0*[0:T_s:(T-T_s)]);
%   [a_k]= fanal(x_T,k,T,T_s)
% generate complex exponential for sum
%------------------------------------------------------------

%Implementation
% compute fundamental frequency in radians
omega_naught = 2*pi/T;
% compute fundamental frequency
fund_freq = omega_naught / 2 / pi;
% check if Ts is an integer multiple of T
N = T_s / T;
N1 = T/T_s;
if(rem(round(N1), 1) == 0)
    
    
else
    a_k = 0;
    return;
end 
D = zeros(kmax, 1);
for k = 1: kmax
% compute complex exponential matrix
vector = 0:N1;

complexMatrix = exp(vector * -1i * omega_naught * T_s * (k-1));    

% convert to column vector and multiple by the signal
%complexMatrix = transpose(complexMatrix);

vector = 1:N1+1;
%disp(size(x_T(vector)))
D(k) = (complexMatrix*x_T(vector))*N;
end
[a_k] = D;

