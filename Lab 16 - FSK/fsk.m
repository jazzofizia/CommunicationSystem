%>>>>>>>>> MATLAB code for binary FSK modulation and de-modulation >>>>>>>%

clc;
clear all;
close all;


x=[ 1 0 0 1 1 0 1];                                    % Binary Information
bp=.000001;                                                    % bit period
disp(' Binary information at Trans mitter :');
disp(x);

%XX representation of transmitting binary information as digital signal XXX
bit=[]; 
for n=1:1:length(x)
    if x(n)==1;
       se=ones(1,100);
    else x(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('transmitting information as digital signal');



%XXXXXXXXXXXXXXXXXXXXXXX Binary-FSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%
A=5;                                          % Amplitude of carrier signal
br=1/bp;                                                         % bit rate
f1=br*8;                           % carrier frequency for information as 1
f2=br*2;                           % carrier frequency for information as 0
t2=bp/99:bp/99:bp;                 
ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A*cos(2*pi*f1*t2);
    else
        y=A*cos(2*pi*f2*t2);
    end
    m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary FSK modulation coresponding binary information');




%XXXXXXXXXXXXXXXXXXXX Binary FSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
for n=ss:ss:length(m)
  t=bp/99:bp/99:bp;
  y1=cos(2*pi*f1*t);                    % carrier siignal for information 1
  y2=cos(2*pi*f2*t);                    % carrier siignal for information 0
  mm=y1.*m((n-(ss-1)):n);
  mmm=y2.*m((n-(ss-1)):n);
  t4=bp/99:bp/99:bp;
  z1=trapz(t4,mm)                                             % intregation 
  z2=trapz(t4,mmm)                                            % intregation 
  zz1=round(2*z1/bp)
  zz2= round(2*z2/bp)
  if(zz1>A/2)      % logic lavel= (0+A)/2 or (A+0)/2 or 2.5 ( in this case)
    a=1;
  else(zz2>A/2)
    a=0;
  end
  mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);


%XXXXX Representation of binary information as digital signal which achived 
%after demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
bit=[];
for n=1:length(mn);
    if mn(n)==1;
       se=ones(1,100);
    else mn(n)==0;
        se=zeros(1,100);
    end
     bit=[bit se];

end
t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(3,1,3)
plot(t4,bit,'LineWidth',2.5);grid on;
axis([ 0 bp*length(mn) -.5 1.5]);
ylabel('amplitude(volt)');
xlabel(' time(sec)');
title('recived information as digital signal after binary FSK demodulation');



%>>>>>>>>>>>>>>>>>>>>>>>>>> end of program >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>%