% everything starts here!

% ---------------------------- clear previous figures and commands ------------------------------------------------------------
clear;
close all;
clc;
% -----------------------------------------------------------------------------------------------------------------------------


% ---------------------------- clear previous figures and commands ------------------------------------------------------------
% load your dataset file here...
% ...change the name of the input file below
data = load('Multi_variable.txt');
% -----------------------------------------------------------------------------------------------------------------------------


% ---------------------------- plotting data  ---------------------------------------------------------------------------------

%you can comment whole this section if you are doing multi-variable linear-regression
%in case of doing single-variable linear-regression, uncomment lines starting with %--/

fprintf('Plotting input dataset ...\n')

% finding the number of variables
% we subtract number of columns by 1 because y also occupies a column
data_columns = columns(data);
var_Num = data_columns - 1;

% separately extracting x-axis and y-axix of the data
X = data(:, 1:var_Num); 
y = data(:, data_columns);

% number of training examples
m = length(y);


% Plot Data
plotData(X, y);

fprintf('plotting input dataset completed successfully...\n');
%pause;
% -----------------------------------------------------------------------------------------------------------------------------

% ---------------------------- Feature Normalization  -------------------------------------------------------------------------

[X_normal mu sigma] = featureNormalization(X);
fprintf('Normalization completed successfully...\n');

%Adding intercept term to X_normal
X_normal  =   [ones(m,1) X_normal];

% -----------------------------------------------------------------------------------------------------------------------------

% ---------------------------- Applying gradient descent  -------------------------------------------------------------------------
fprintf('Running gradient descent ...\n');

% choose best alpha value for your case
% you may run this program multiple times to guess the best value
alpha = 0.03;
num_iters = 400;

% init Theta and run Gradient Descent 
theta = zeros(var_Num+1, 1);
[theta, J_history] = gradientDescent(X_normal, y, theta, alpha, num_iters);

% plot the convergence graph
figure('Name','Computed cost variation when increasing the number of iterations');
plot(1:numel(J_history), J_history, '-r', 'LineWidth', 3);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('\n');
% -----------------------------------------------------------------------------------------------------------------------------

% ---------------------------- Using normal equation  -------------------------------------------------------------------------
data_ne = load('Multi_Variable.txt');

%   depending on size of your dataset, you may want to use normalEquation method 
%   to calculate theta. it is simpler than gradientDescent and much more straightforward

% our data did not change but in order to keep everything separated for
% debugging and other purposes, I changed variable names

% finding the number of variables
% we subtract number of columns by 1 because y also occupies a column
data_columns_ne = columns(data_ne);
var_Num_ne      = data_columns_ne - 1;

X_ne = data_ne(:, 1:var_Num_ne);
y_ne = data_ne(:, data_columns_ne);
m_ne = length(y_ne);

% Add intercept term to X
X_ne = [ones(m_ne, 1) X_ne];

% Calculate the parameters from the normal equation
theta_ne = normalEquation(X_ne, y_ne);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta_ne);
fprintf('\n');


fprintf('note that the Theta computed from the \n');
fprintf('normal equations and gradientDescent are not neccesairly the same \n');
fprintf('In fact, your ouput prediction for a sample input must be very close using either mothods \n');

% -----------------------------------------------------------------------------------------------------------------------------