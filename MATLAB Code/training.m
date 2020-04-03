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
temp=0;
m = 0;
c = 0;
scat1 = [];
scat2 = [];
hold on
      for i = 1:size(t(:,1))
          if(t(i,1)+2*t(i,2)-2 >0)
              scat1 = [scat1; t(i,1) t(i,2)];
          else
              scat2 = [scat2 ; t(i,1) t(i,2)];
          end
      end
      s1 = scatter(scat1(:,1),scat1(:,2));
      s2 = scatter(scat2(:,1),scat2(:,2));
      
             tic
             for epoc = 1:100
                     
                 [weight,error, temp] = Delta_Rule(weight, input, out ,alpha, damp, epoc, temp);
                 errorplot(end+1) = error;
                 if (epoc == 5 || epoc == 10 || epoc == 50 || epoc == 100)
                    array(end+1) = error;
                    w = [w;weight];
                    m = -weight(1,3)/weight(1,2);
                    c = -weight(1,1)/weight(1,2);
                    data_interval = [-10 10];
                    f = @(data_interval) m*data_interval+c;
                    fplot(f,[-10 10]);
                    xlabel('First input variable(x1)');
                    ylabel('Second input variable(x2)');
                    title('Decision surface after 5,10,50,100 iterations');
                    
                 end                   
             end
             time = toc;
             fprintf('Total execution time: %f \n',time);
      hold off 
      fprintf('Number of weight updates %i \n',temp);
      figure;

      plot(errorplot);
      xlabel('Iterations');
      ylabel('Error');
      title('Error plotting');
      

 
     
 
  