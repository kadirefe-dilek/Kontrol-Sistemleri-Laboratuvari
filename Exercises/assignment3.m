% Identify the given intervals and constant variables
x = 0:2*pi;
y = -pi/2:pi/2;
alfa = 5;
T = 1;
F = 1;
B = 0.2;

% Defining the graph and the interval the graph will be plotted on
[x,y] = meshgrid(x,y);
s = alfa*exp(-B.*x).*(sin(T.*x).*cos(F.*y));

% plotting the graph on screen
mesh(s)

% “surf()” function also can be used
% surf(x,y,s)
