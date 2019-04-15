x=0:pi/50:2*pi;
y1=x.^2;
H1=area(x,y1);
hold on
idx=x>3&x<4;
H=area(x(idx),y1(idx));
set(H(1),'FaceColor',[1 0.5 0]);