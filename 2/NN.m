function X = NN(Z, A1, A2, B1, B2)
    W1 = A1*Z + B1;
    Z1 = reLU(W1);
    W2 = A2*Z1 + B2;
    X = sigmoid(W2);
end 