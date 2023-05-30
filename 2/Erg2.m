%% Problem 1
clear all;
load('data21.mat'); 
icon = ones(10*28,10*28);
for i=1:10
    for j = 1:10
        z = normrnd(0,1,[10,1]);
        x = NN(z,A_1,A_2,B_1,B_2);
        x = reshape(x,[28 28]);
        icon(28*(i-1)+1:28*(i-1)+28,28*(j-1)+1:28*(j-1)+28) = ...
            x(:,:);
    end
end
% imshow(icon);
z = normrnd(0,1,[10,1]);
%% Problem 2
load('data22.mat');

% choose 1 of the 4 Xi images choice = 1 or 2 or 3 or 4
    choice = 4;
% the number of pixels to choose from the Xn image 
    N = 300;
% The m of gradient descent 
    m = 0.00001;
% Matrix T
    T = createT(N);
    
xn = T*X_n(:,choice);
e1 = 10000;
imshow(reshape(xn, [28 28]));
while(e1>790)
    e1 = N*log( (T*NN(z,A_1,A_2,B_1,B_2)-xn)'*(T*NN(z,A_1,A_2,B_1,B_2)-xn)) + z'*z;
    W1 = A_1*z + B_1;
    Z1 = reLU(W1);
    W2 = A_2*Z1 + B_2;
    x = sigmoid(W2);
    
    U2 = u2(x,xn,T);
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

subplot(1,3,1);
    imshow(reshape(X_i(1:784,choice),[28 28]));
subplot(1,3,2);
    imshow(reshape(xn,[28 28]));
subplot(1,3,3);
    imshow(reshape(NN(z,A_1,A_2,B_1,B_2),[28 28]));