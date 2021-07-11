%assignment 9 11-07-2021 

a=[0 2 2 0];
b=[0 0 2 2];
c=[0 4 4 0];
d=[0 0 4 4];
e=[0 1 1 0];
f=[0 0 1 1];
g=[-4 -4 4 4];
h=[-4  4 4 -4];
k=hgtransform;
l=hgtransform;
m=hgtransform;
n=hgtransform;

patch("XData",c,"YData",d,"FaceColor","red",'EdgeColor','none',"Parent",k);
patch("XData",a,"YData",b,"FaceColor","black",'EdgeColor','none',"Parent",l);
patch("XData",e,"YData",f,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none',"Parent",m);
patch("XData",g,"YData",h,'FaceColor',"none",'EdgeColor','black',"Parent",n);

set(gca,'XTick',[], 'YTick', []);

ax = gca;
ax.XAxisLocation = 'origin'
ax.YAxisLocation = 'origin'



axis equal
xlim([-4 4]);
ylim([-4 4]);

r1=2*pi;
r2=0;
for t=linspace(0,1,1000)
    l.Matrix=makehgtform("zrotate",r1+t*(r2-r1));
    drawnow
end
