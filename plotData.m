
## function PlotData
## this function, plots a 2-dimensional representation for each variable

function plotData (X, Y)
  

% opening a new figure window
figure ('Name','The input dataset');

% number of coloumns of X is the number of variables
columns_X = columns(X);

for i = 1:columns_X
  
  subplot(columns_X,1,i);
  plot( X (:,i) , Y , 'm*' , 'MarkerSize' , 8);
  
  ylabel('The y-axis representation of your data');
  % you can add a switch-case statement here to write separate explanations ...
  % ... for each X-axis
  xlabel('The x-axis representation of your data');
  
endfor


%plot( X , Y , 'm*' , 'MarkerSize' , 8);


end
