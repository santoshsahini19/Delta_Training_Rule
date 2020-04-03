t = randi([-10,10],100,2);
for i = 1:size(t(:,1))
    
    if(t(i,1)+ 2*t(i,2)-2 > 0)
        t(i,3) = 1;
    else
        t(i,3) = -1;
    end
end

csvwrite('data.txt',t);