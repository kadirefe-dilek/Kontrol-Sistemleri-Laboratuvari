%Shapes’ points for edges
a=[0 2 2 0];
b=[0 0 2 2];
c=[0 4 4 0];
d=[0 0 4 4];
e=[0 1 1 0];
f=[0 0 1 1];
g=[-4 -4 4 4];
h=[-4 4 4 -4];
%Creating transform object
k=hgtransform;
l=hgtransform;
m=hgtransform;
n=hgtransform;
%Printing the shapes
patch("XData",c,"YData",d,"FaceColor","red",'EdgeColor','none',"Parent",k);
patch("XData",a,"YData",b,"FaceColor","black",'EdgeColor','none',"Parent",l);
patch("XData",e,"YData",f,'FaceColor',[0.5 0.5 0.5],'EdgeColor','none',"Parent",m);
patch("XData",g,"YData",h,'FaceColor',"none",'EdgeColor','black',"Parent",n);
%Clear the x -axis and y-axis’ edge values
set(gca,'XTick',[], 'YTick', []);
%Draw lines in the graph
ax = gca;
ax.XAxisLocation = 'origin'
ax.YAxisLocation = 'origin'
%Indicates the limits of the axis’
axis equal
xlim([-4 4]);
ylim([-4 4]);

% Rotates the middle black square 360 degrees.
r1=2*pi;
r2=0;
for t=linspace(0,1,1000)
l.Matrix=makehgtform("zrotate",r1+t*(r2-r1));
drawnow
end
