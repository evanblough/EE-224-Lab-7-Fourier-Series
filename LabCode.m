%Lab Example Displays
%Part 2 Exercise 1 Demonstrate Functioning Fourier Analysis Function
x_T=[ones(1000,1);zeros(1000,1)];
T=0.01;
T_s = T/2000;
x = fanal(x_T, 4, T,T_s);
figure(1);
subplot(1,2,1);
stem(x);
title('Part 1 Ak coefficents of square wave Spectrum'), 
xlabel('k-1'), 
ylabel('|a(k)|'), 
subplot(1,2,2);
stem(imag(x));
title('Part 1 Phase Ak coefficents of square wave Spectrum'), 
xlabel('k-1'), 
ylabel('j'), 

%Part 2 Exercise 3 Demonstrate Functioning Fourier Synthesis Function
%Square wave
figure(2);
T = 2;
Ts = 0.001;
C = [1/2; -1/i/pi; 0; -1/3/i/pi; 0; -1/5/i/pi; 0; -1/7/i/pi; 0; -1/9/i/pi; 0; -1/11/i/pi; 0; -1/13/i/pi; 0;];
y = fsynt(C,T,Ts);
plot(real(y));
title('Plot of summation'), 
xlabel('t*Ts'), 
ylabel('y'),

%Part 2 Exercise 4 Analyze sampled audio using fourier series
disp('peroid of trumpet is: ');
disp(170/44100);
disp('peroid of whistle is: ');
disp(85/44100);
figure(3);

load('trumpet_whistle.mat');

z = fanal(trumpet, 10, 170/44100, 1.0625/44100);
z1 = z(2:length(z));
z2 = vertcat(conj(flipud(z1)), z);
subplot(1,2,1);
stem(z2);
title('Part 1 Ak coefficents of trumpet wave Spectrum'), 
xlabel('k'), 
ylabel('|a(k)|'), 
subplot(1,2,2);
stem(imag(z2));
title('Part 1 Phase Ak coefficents of trumpet wave Spectrum'), 
xlabel('(-k - k)'), 
ylabel('j'), 

figure(4);
whis = fanal(whistle, 10, 85/44100, 85/80/44100);
whis1 = whis(2:length(whis));
whis2 = vertcat(conj(flipud(whis1)), whis);
subplot(1,2,1);
stem(whis2);
title('Part 1 Ak coefficents of whistle wave Spectrum'), 
xlabel('(-k - k)'), 
ylabel('|a(k)|'), 
subplot(1,2,2);
stem(imag(whis2));
title('Part 1 Phase Ak coefficents of whistle wave Spectrum'), 
xlabel('k'), 
ylabel('j'), 

%%part d

figure(5);
whisaprox =  fsynt(whis, 85/44100, 1/44100);
subplot(1,2,1);
plot(real(whisaprox));
title('Whistle Aprroximation'), 
xlabel('t*Ts'), 
ylabel('y'), 
subplot(1,2,2);
plot(whistle);
title('Whistle Actual'), 
xlabel('t*Ts'), 
ylabel('y'), 

figure(6);
trumpaprox =  fsynt(z, 170/44100, 1/44100);
subplot(1,2,1);
plot(real(trumpaprox));
title('Trumpet Aprroximation'), 
xlabel('t*Ts'), 
ylabel('y'), 
subplot(1,2,2);
plot(trumpet);
title('Trumpet Actual'), 
xlabel('t*Ts'), 
ylabel('y'), 


%Part f Compare original audio with recreation

%milsoundT
%milsoundTA

%milSound




