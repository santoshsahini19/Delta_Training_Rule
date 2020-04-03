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
damp = 1;
temp = 0;
             tic
             for epoc = 1:100
                     
                 [weight,error] = Delta_Rule1(weight, input, out ,alpha, damp, epoc);
                 temp = temp+1;
                 errorplot(end+1) = error;
                 if (epoc == 5 || epoc == 10 || epoc == 50 || epoc == 100)
                    array(end+1) = error;
                    w = [w;weight];
                 end
                 
             end
             time = toc;
             
             fprintf('Total execution time %f \n',time);
             fprintf('Number of weight updates %i \n',temp);
             
      figure;
      
      plot(errorplot);
      xlabel('Iterations');
      ylabel('Error');
      title('Error plotting');
      
      
      
     
 
  