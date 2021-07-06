temp = [10 19; 11 22; 12 20; 13 21]; % orijinal matris
time = temp(:,1);    % zaman matrisi
tempretures = temp(:,2); % sıcaklık matrisi
allsorted = zeros(4,2); % zamanlarıyla birlikte sıralanan sıcaklık verilerini tutmak için matris

temp_max = max(tempretures);  % en yüksek sıcaklığı tutan değişken

ascending = (sort(tempretures))'; % sıcaktan soğuğa sıralar ve satır haline getirir
descending = (sort(tempretures, 'descend'))'; % soğuktan sıcağa doğru sıralar ve satır haline getirir

% size(temp(:,1)) is the number of rows
for n=1:size(temp(:,1)) % en yüksek sıcaklığın olduğu zamanı bulan döngü
    if temp(n,2) == temp_max
        time_max = temp(n,1);
    end
end

for m=1:size(temp(:,1))   % zamanları da sıcaklığa göre sıralayan döngü
    for n=1:size(temp(:,1))
       if temp(n,2) == descending(m)
           allsorted(m,:) = temp(n,:);
           break    % exits loop when assignment is done
       end
    end
end

% istenen veriler ekrana yazılır
fprintf("Here is the original time-tempreture matrix: \n")
disp(temp(1:4,:))

fprintf("Max tempreture measured is: %g\n\n", temp_max)

fprintf("Tempretures sorted from coldest to the highest: \n")
disp(ascending)

fprintf("\nMax tempreture is measured at interval %g.\n\n", time_max)

fprintf("Sorted tempretures along their times: \n")
disp(allsorted)