function res = PHI(Vector1,Vector2,T)
    X = T*Vector1;
    dif = (X-Vector2);
    res = 2*dif/(dif' * dif);
end 