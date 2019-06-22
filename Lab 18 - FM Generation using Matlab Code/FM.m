%A frequency-modulated signal can be generated using the following MATLAB code:
clc
clear all
close all
 t = 0:255;
 t = t/256;
 f = 2;
 fc = 20;
beta = 5;
 m = sin(2*pi*f*t);
xc = cos(2*pi*fc*t + beta*m);
figure(6)
plot (t,xc)
figure(4)
%Write some additional MATLAB code to find and plot the spectrum.  Compare the spectral values to those computed using Bessel functions.
%The FM signal can be demodulated using a phase-lock loop.  A phase lock loop uses a phase discriminator to find the difference between the phase of xc and the phase of a voltage controlled oscillator (VCO).  This difference is applied to the control input to the VCO.  The following MATLAB code demodulates the FM.  Put this code into an ?.m? file and execute the m-file.  Describe the plots.
	 t = 0:255;
	t = t/256;
	f = 2;
	fc = 20;
	beta = 2;
	m = sin(2*pi*f*t);
	xc = cos(2*pi*fc*t + beta*m);
	
	fo = zeros(1,256);
	ff = zeros(1,256);
	ff = fc + 4*cos(2*pi*f*t);
	x = zeros(1,256);
	disc = zeros(1,256);
	fo(1) = 20;
	
	for i=1:256
	 disc(i) = 2*pi*fc*t(i) + beta*m(i) - 2*pi*fo(i)*t(i);
	 if (i ~= 1)
	   x(i) = (disc(i) - disc(i-1))*256/(2*pi);
	 else
	   x(i) = disc(i)*256/(2*pi);
	 end;
	 if (i ~= 256)
	   fo(i+1) = fc + 0.001*x(i);
	 end;
	end;
	
	subplot(2,1,1)
	plot(t,disc);
	ylabel('Discriminator');
	title('Output of Discrminator');
	subplot(2,1,2)
	plot(t,x);
	ylabel('x');
	title('Adjustment to VCO');
