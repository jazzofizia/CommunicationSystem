t=0:0.01:1;
y=0;
z=0;
for i=1:2:12
yt=1/i*(sin(2*pi*i*t));
y=y+yt;
end
for j=2:2:12
zt=1/j*(sin(2*pi*j*t));
z=z+zt;
end
x=y-z;
area(t,x)
%plot(t,x)