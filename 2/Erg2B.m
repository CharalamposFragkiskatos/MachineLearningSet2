%% Problem 3
clear all;

load('data23.mat');
load('data21.mat');
% choose 1 of the 4 Xi images choice = 1 or 2 or 3 or 4
    choice = 3;
% The m of gradient descent 
    m = 0.00001;
% Matrix T
    T = createT2();
    
xn = X_n(:,choice);
e1 = 10000;
imshow(reshape(xn, [7 7]));
N = 49;
z = normrnd(0,1,[10,1]);
while(e1>0)
    e1 = N*log( (T*NN(z,A_1,A_2,B_1,B_2)-xn)'*(T*NN(z,A_1,A_2,B_1,B_2)-xn)) + z'*z;
    W1 = A_1*z + B_1;
    Z1 = reLU(W1);
    W2 = A_2*Z1 + B_2;
    x = sigmoid(W2);
    
    U2 = T'*u2(x,xn,T);
    V2 = U2 .* sigmoiddot(W2);
    U1 = A_2' * V2;
    V1 = U1 .* reLUdot(W1);
    U0 = A_1'*V1;
    Gradient = N*U0 + 2*z;
    z = z - m * Gradient;
    error = e1 - N*log((T*NN(z,A_1,A_2,B_1,B_2)-xn)'*(T*NN(z,A_1,A_2,B_1,B_2)-xn)) + z'*z;
    % e1
    % pause(0.5);
end

subplot(1,4,1);
    imshow(reshape(X_i(1:784,choice),[28 28]));
subplot(1,4,2);
    imshow(reshape(xn,[7 7]));
subplot(1,4,3);
    imshow(reshape(NN(z,A_1,A_2,B_1,B_2),[28 28]));
subplot(1,4,4);
    imshow(reshape(T*NN(z,A_1,A_2,B_1,B_2),[7 7]));