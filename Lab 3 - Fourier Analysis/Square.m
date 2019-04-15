t=0:0.01:1;
y=0;
for i=1:2:300
yt=1/i*(sin(2*pi*i*t));
y=y+yt;
end
plot(t,y)
