% Defining the function IsTriangle which takes lengths as a vector and returns void
function [] = IsTriangle(len)

    % checking for the length property of triangle 
    if (abs(len(1)+len(2)) >= abs(len(3)) && abs(len(1)+len(3)) >= abs(len(2)) && abs(len(2)+len(3)) >= abs(len(1)))
        triangle = true;    % assigning boolean type to true if condition (property) holds
    else
        triangle = false;   % assigning boolean type to false if condition (property) does not hold
    end

    % checks the property and prints the output
    if triangle     % if it is a triangle
        fprintf("The lengths of [");
        fprintf('%g, ', len(1:end-1));
        fprintf('%g] denotes a triangle.\n', len(end));
        % if it is an equilateral triangle
        if len(1) == len(2) && len(1) == len(3)     
            fprintf("The triangle [");
            fprintf('%g, ', len(1:end-1));
            fprintf('%g] is an equilateral triangle.\n', len(end)); 
       

       % if it is an isosceles triangle
        elseif len(1) == len(2) || len(1) == len(3) || len(2) == len(3)
            fprintf("The triangle [");
            fprintf('%g, ', len(1:end-1));
            fprintf('%g] is an isosceles triangle.\n', len(end));
        % if it is not either - in other words: a scalene triangle 
        else
            fprintf("The triangle [");
            fprintf('%g, ', len(1:end-1));
            fprintf('%g] is a scalene triangle.\n', len(end));
        end
    else            % if it is not a triangle
        fprintf("The lengths of [");
        fprintf('%g, ', len(1:end-1));
        fprintf('%g] does not denote a triangle.\n', len(end));
    end
end
