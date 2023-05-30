function res = reLUdot(W)
res = ones(128,1);
    for i=1:128
        if W(i,1) <= 0
             res(i,1) = 0;
             % res(i,1) = 1;
        else

            res(i,1) =1;
        end
    end
end 