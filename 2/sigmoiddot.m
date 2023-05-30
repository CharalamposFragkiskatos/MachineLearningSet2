function res = sigmoiddot(W)
    res = -exp(W)./((1+exp(W)).*(1+exp(W)));
end 