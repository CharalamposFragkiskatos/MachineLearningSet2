function T = createT(n)
    
    T = zeros(784,784);
    T(1:n,1:n) = eye(n);

end 