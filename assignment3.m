% verilen aralık ve sabitleri tanımlama
x = 0:2*pi;
y = -pi/2:pi/2;
alfa = 5;
T = 1;
F = 1;
B = 0.2;

% grafiği ve grafiğin çizileceği tabanı oluşturma
[x,y] = meshgrid(x,y);
s = alfa*exp(-B.*x).*(sin(T.*x).*cos(F.*y));

% grafiği ekrana bastırma
mesh(s)

% surf fonksiyonu da kullanılabilir:
% surf(x,y,s)
