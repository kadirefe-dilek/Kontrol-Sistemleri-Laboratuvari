temp = [10 19; 11 22; 12 20; 13 21]; % Original matrix
time = temp(:,1);    % Time matrix
temperatures = temp(:,2); % Temperature matrix
allsorted = zeros(4,2); % Matrix created to hold time and temperatures 

temp_max = max(temperatures);  % The variable saves the maximum temperature value

ascending = (sort(temperatures))'; % Sorts the temperatures in ascending order and creates a %horizontal vector out of it
descending = (sort(temperatures, 'descend'))'; % Sorts the temperatures in descending order %and creates a horizontal vector out of it

% size(temp(:,1)) is the number of rows
for n=1:size(temp(:,1)) % The loop contains max temperature
    if temp(n,2) == temp_max
        time_max = temp(n,1);
    end
end

for m=1:size(temp(:,1))   % The loop that sorts the times due to temperatures
    for n=1:size(temp(:,1))
       if temp(n,2) == descending(m)
           allsorted(m,:) = temp(n,:);
           break    % Exits loop when assignment is done
       end
    end
end

% Printing out the wanted values
fprintf("Here is the original time-temperature matrix: \n")
disp(temp(1:4,:))

fprintf("Max temperature measured is: %g\n\n", temp_max)

fprintf("Temperatures sorted from coldest to the highest: \n")
disp(ascending)

fprintf("\nMax temperature is measured at interval %g.\n\n", time_max)

fprintf("Sorted temperatures along their times: \n")
disp(allsorted);
