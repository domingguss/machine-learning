function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_all = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_all = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

error = 100;
optimal_C = 0;
optimal_sigma = 0;

for i=1:8
  for j=1:8
  break;break;
    current_C = C_all(1,i);
    current_sigma = sigma_all(1,j);
    
    fprintf("\ncurrent: C: %f sigma: %f\n", current_C, current_sigma);
    
    model = svmTrain(X, y, current_C, @(x1, x2) gaussianKernel(x1, x2, current_sigma));
    predictions = svmPredict(model, Xval);

    current_error = mean(double(predictions ~= yval));
    
    if current_error < error
      fprintf("\nOPTIMAL ONE current_error: %f vs error %f\n\n", current_error, error);
      error = current_error;
      optimal_C = current_C;
      optimal_sigma = current_sigma;
    end    
  end
end


    fprintf("OPTIMUM: C: %f sigma: %f", optimal_C, optimal_sigma);
C = 1.0;%optimal_C;
sigma = 0.1%optimal_sigma;

% =========================================================================

end
