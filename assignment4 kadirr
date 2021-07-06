function [Tc] = conv(Tf)

% fahrenheit-celcius dönüşümü
Tc = (5/9)*(Tf - 32);

% sonucun ekrana yazdırılması
disp(Tc)

% 5'ten fazla input varsa grafik çizme ve velvius değerlerini .mat
% formatında saklama
if length(Tf) > 5
    plot(Tf, Tc);
    title("Fahrenheit-Celcius Conversion")
    xlabel("Fahrenheit Scale (°F)")
    ylabel("Celcius Scale (°C)")
    save temp-conversions.mat Tc;
end

end
