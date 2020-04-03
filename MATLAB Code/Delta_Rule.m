function [weight,error, temp] = Delta_Rule(weight, input, correct_output, alpha, damp, epoc,temp)
co = 0;
ico = 0;
N = size(input,1);
for k = 1:N
    d = correct_output(k);
    weighted_sum = sum(weight.*input(k,:));
    output = sigmoid(weighted_sum);

    error = (d - output);
    if d ~= output
        ico = ico+1;
    else
        co = co+1;
    end
            
    delta = error;

    dweight = (damp^epoc)*alpha*delta*input(k,:);
    weight = weight + dweight;
    temp = temp+1;
end

error = ico/(co+ico);
%subplot(2,1,1);
%plot(,error);
%xlabel('Iterations');
%ylabel('Error');

%meanErr = sum(error)/N;
end


