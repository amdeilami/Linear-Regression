function [theta] = normalEquation(X, y)


%   depending on size of your dataset, you may want to use normalEquation method 
%   to calculate theta. it is simpler than gradientDescent and much more straightforward


%   this function computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);

% -------------------------------------------------------------

term1   =   X' * X;
term1   =   pinv(term1);
term2   =   X' * y;
theta   =   term1 * term2;


% -------------------------------------------------------------


end
