%>>>>>>>>> MATLAB code for binary PSK modulation and de-modulation >>>>>>>%

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



%XXXXXXXXXXXXXXXXXXXXXXX Binary-PSK modulation XXXXXXXXXXXXXXXXXXXXXXXXXXX%
A=5;                                          % Amplitude of carrier signal 
br=1/bp;                                                         % bit rate
f=br*2;                                                 % carrier frequency 
t2=bp/99:bp/99:bp;                 
ss=length(t2);
m=[];
for (i=1:1:length(x))
    if (x(i)==1)
        y=A*cos(2*pi*f*t2);
    else
        y=A*cos(2*pi*f*t2+pi);   %A*cos(2*pi*f*t+pi) means -A*cos(2*pi*f*t)
    end
    m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('time(sec)');
ylabel('amplitude(volt)');
title('waveform for binary PSK modulation coresponding binary information');




%XXXXXXXXXXXXXXXXXXXX Binary PSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXX
mn=[];
for n=ss:ss:length(m)
  t=bp/99:bp/99:bp;
  y=cos(2*pi*f*t);                                        % carrier siignal 
  mm=y.*m((n-(ss-1)):n);
  t4=bp/99:bp/99:bp;
  z=trapz(t4,mm)                                              % intregation 
  zz=round((2*z/bp))                                     
  if(zz>0)                                        % logic level = (A+A)/2=0 
                         %becouse A*cos(2*pi*f*t+pi) means -A*cos(2*pi*f*t)
    a=1;
  else
    a=0;
  end
  mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);


%XXXXX Representation of binary information as digital signal which achived 
%after PSK demodulation XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
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
title('recived information as digital signal after binary PSK demodulation');



%>>>>>>>>>>>>>>>>>>>>>>>>>> end of program >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>%