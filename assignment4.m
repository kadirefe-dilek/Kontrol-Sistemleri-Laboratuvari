function [Tc] = conv(Tf)
%With below 5 line you can also take input from the user inside the function
% x=input("how many temperature do you want to enter:");
% t=[1:x];
% for n=1:x;
% t(:,x)=input("Enter a temperature: ");
% end
% fahrenheit-celsius transformation
Tc = (5/9)*(Tf - 32);
% Print out the result to the screen with “disp()” function
disp(Tc)
% If there are more than 5 inputs, the the code plots a graph and saves the celsius values in
%.mat format
if length(Tf) > 5
plot(Tf, Tc,'-m.');
title("Fahrenheit-Celsius Conversion")
xlabel("Fahrenheit Scale (°F)")
ylabel("Celsius Scale (°C)")
save temp-conversions.mat Tc;
end
end