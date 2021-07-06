% grafiklerin çizileceği aralığı ve sıklığı oluşturma
t = 0:0.2:2*pi;

% grafiğin basılacağı aralığı oluşturma
xlim([0 2*pi])
ylim([-1.5 1.5])

% grafiği çizilecek fonksiyonları tanımlama
e = exp(-t);
s = sin(t);

% iki grafiği tek plot fonksiyonu ile kareli arka plana çizme
plot(t,e,"m--*", t,s,"r-o");
grid;

% grafik başlığı, x etiketi ve y etiketi oluşturma
title("Grafik Penceresi");
xlabel("x ekseni");
ylabel("y ekseni");

% tepe noktası ifadesini yazdırma
text(2,1,"tepe noktası")
