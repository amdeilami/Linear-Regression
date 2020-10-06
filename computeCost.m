function J = computeCost(X, y, theta)


% number of training examples
m = length(y); 

% the cost that we shall calculate
J = 0;


Hypothesis  =   X * theta;
Sigma       =   Hypothesis - y;
Sigma       =   Sigma .* Sigma;

J           =   ( 1/(2*m) ) * sum(Sigma);



end
