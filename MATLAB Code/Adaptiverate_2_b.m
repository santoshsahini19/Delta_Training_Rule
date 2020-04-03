clc; clear;

t = csvread('data.txt');

input = t;
out = t(:,end);
input(:,end) = ones(size(t,1),1);  
weight = [0.3 0.5 1.4]; 
w = [];
errorplot = [];
z= [5 10 50 100];      
array = [];
alpha = 0.01;
damp = 0.8;
increment = 1.2;
factor = 1;
errorprev = 0;
weightprev = weight;
threshold = 0.002;
             for epoc = 1:100
                     
                 [weight,error] = Delta_Rule1(weight, input, out, alpha, factor, 1);
                 if (error-errorprev) > threshold
                    factor = damp;
                    weight = weightprev;
                 else
                    factor = increment;
                 end
                 errorplot(end+1) = error;
                 errorprev = error; 
                 weightprev = weight;
             end
           
      figure;

      plot(errorplot);
      xlabel('Iterations');
      ylabel('Error');
      title('Adaptive effect plot');
       
      
       
 
     
 
  