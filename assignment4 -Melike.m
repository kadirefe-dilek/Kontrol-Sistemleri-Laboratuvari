function [fa]=cel(t)
x=input("how many temprature do you want to enter:");
t=[1:x];
for n=1:x;
    t(:,x)=input("Enter a temprature: ");
end
fa= (5/9)*(t-32);
save conversion.mat fa; 
disp(fa);

if(x>5);
    plot(t,fa);
    title("Fahrenheit-Celcius Conversion");
    xlabel("Celcius (°C)");
    ylabel("Fahrenheit (°F)");
end
end
