% Assignment 5: Take input from the user for three lengths and check if 
% these lengths are able to denote a triangle. If so, state the type of the
% triangle in sense of side lengths. (equilateral-isosceles-scalene)

% defining function IsTriangle wich takes no input argument
function [] = IsTriangle()

    % Taking the length data and holding it in a vector
    fprintf("Enter three lengths:\n")
    len(1) = input("First length: ");
    len(2) = input("Second length: ");
    len(3) = input("Third length: ");

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
