Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

S = 0.7*sin(2*pi*20*t) + ...
sin(2*pi*40*t) + ...
sin(2*pi*150*t) + ...
sin(2*pi*300*t);
%noise
%S = S + 2*randn(size(t))
subplot(2,1,1)
plot(t(1:500),S(1:500))
hold on
title('Signal')
xlabel('t (seconds)')
ylabel('X(t)')

Y = fft(S);
%plot((Y(1:300)))
%plot(abs(Y(1:300)))
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(2,1,2)
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')