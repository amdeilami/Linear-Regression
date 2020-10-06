function [X_norm, mu, sigma] = featureNormalization(X)

%   this function returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.


X_norm = X;

% storing number of rows in X
% it is actually the number of our examples
m     = size(X,1);

% creating new matrices to soter mu and sigma for further processing
mu    = zeros(1, size(X, 2));
sigma = zeros(1, size(X, 2));

% in order to normalize features, first we subtract each column of features from their mean
% then we divide each column by its standard deviation

       

% what does mean(X) do?
% If X is a matrix, mean(X) computes the arithmetic mean for...
% each column and return them in a row vector.
mu    = mean(X);

% what does std(X) do?
% If X is a matrix, std(X) computes the standard deviation for...
% each column and return them in a row vector.
sigma = std(X);

% extending mu and sigma for doing component-wise calculations
increased_mu    = [ mu ; repmat(mu , (m-1) , 1) ];
increased_sigma = [sigma ; repmat(sigma , (m-1) , 1) ];

X_norm = X - increased_mu;
X_norm = X_norm ./ increased_sigma;



end