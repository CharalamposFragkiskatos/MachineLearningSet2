function res = u2(Vector1,Vector2,T)
    res = zeros(784,1);
    X = T*Vector1; 
    dif = (X-Vector2);
    res = 2*dif/(dif' * dif);
end 