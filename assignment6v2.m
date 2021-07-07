% Assignment 6: Write an m-function that takes "n" as an input and gives an,
% "n x n" identity matrix as an output.

% defining the function Identity
function [identity] = Identity(n)
    
    % creating a zeros matrix
    identity = zeros(n);

    % filling diagonal with ones
    for k = 1:n
        for m = 1:n
            if k == m
                identity(k,m) = 1;
            end
        end
    end
    
end
