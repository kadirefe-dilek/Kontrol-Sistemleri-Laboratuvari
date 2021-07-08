% Defining the interval in which the graph will be plotted
t = 0:0.2:2*pi;

%  Identify the functions to be plotted
e = exp(-t);
s = sin(t);

% Plotting 2 graphs on grid with one plot function
plot(t,e,"m--*", t,s,"r-o");
grid;

% Stating the intervals of axises
xlim([0 2*pi]);
ylim([-1.5 1.5]);

%Title of graph, x label ve y label oluşturma
title("Grafik Penceresi");
xlabel("x ekseni");
ylabel("y ekseni");
text(2,1,"tepe noktası");  % Printing out “tepe noktası” at the wanted point
