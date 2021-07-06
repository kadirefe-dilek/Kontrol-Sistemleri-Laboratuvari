% Assignment7: Write an m-function that takes an array x as input and 
% outputs another array s in which the elements in x are sorted using
% sledgehammer sorting.

disp("When entering the array use matlab syntax ([1,1 ... 1,n; ... ; m,1 ... m,n])");
x = input("Enter an array: ");

size_of_x = size(x);     % size of array x, vector: [rows, columns]
rows = size_of_x(1);     % number of rows in array x 
cols = size_of_x(2);     % number of columns in array x

disp(x);    % outputs the original array

x_vector = x(1:end);    % creating a one row array (a vector) from the  
                        % actual array to use null assignment freely

s = zeros(rows,cols);   % creates a zeros array to fix the size
for m = 1:rows      % counts for rows
    for n = 1:cols  % counts for columns
        s(m,n) = max(x_vector);     % copies max value to the next location in s
        for k = 1:length(x_vector)   % loop that deletes (assigns null to) the index holding max value
            if x_vector(k) == max(x_vector)     % determines the first index holding max value
                x_vector(k) = [];   % executes null assignment
                break   % breaks the assignment loop in order to modify only one index at a time
            end
        end
    end
end

disp(s);    % outputs the resulting sorted array
