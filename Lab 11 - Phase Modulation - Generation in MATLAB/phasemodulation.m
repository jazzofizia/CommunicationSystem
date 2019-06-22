%Question 5
clear all
close all
t = 0:0.01:1;                  % time variable
fc = 5;                        % carrier frequency
%------------------------------------------
% create message signal m(t)
m = sin(2*pi*t);
%------------------------------------------
kp  = pi/2;                 % phase deviation constant
%------------------------------------------------
% modulating the carrier with the message signal
carrier = cos(2*pi*fc*t);
modulated = cos(2*pi*fc*t + kp*m);
%------------------------------------------------
%------------------------------------------------
% Plotting the signals
plot(t,m,'b',t,carrier,'r',t,modulated,'k--')
axis([0 1 -1.5 1.5]);
xlabel('Time(seconds)');
ylabel('Amplitude(volt)');
title('Phase modulation');
legend('Message','Carrier','Modulated');
