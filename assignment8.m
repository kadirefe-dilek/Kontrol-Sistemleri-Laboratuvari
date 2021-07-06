%assignment 8 6-7-2021

function[]= MyCircle(ctr,rds,n,styl) 

%kullanıcı ara yüzüyle bu şekilde değişkenler de alınabilir

%ctr=[1:2];
%rds=input("Radius:");
%for n=1:2;
%ctr(1,n)=input("Center:");
%end
%n=input("Number of the points:");
%styl=input("Style of the plot:","s");

teta=0:2*pi/n:2*pi;
xunit=rds*cos(teta)+ctr(1,1);
yunit=rds*sin(teta)+ctr(1,2);
cir=plot(xunit,yunit,styl);

end
