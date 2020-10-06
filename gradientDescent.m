function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
  
%   this function Performs gradient descent to learn theta
%   it updates theta by taking num_iters gradient steps 
%   with learning rate alpha

% initialize some useful values...

% number of training examples
m = length(y); 

% cost at each step
J_history = zeros(num_iters, 1);

constant = alpha * (1 / m);

for iter = 1:num_iters

    %    performing a single gradient step on the parameter vector theta. 
  
    %    while debugging, it can be useful to print out the values
    %    of the cost function (computeCostMulti) and gradient here.
    
    Hypothesis    =   X * theta;
    Aux           =   Hypothesis - y;
    Aux           =   X' * Aux;
    theta         =   theta - ( constant * Aux);


    % ---------------------------------------------------------

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end