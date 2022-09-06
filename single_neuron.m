clear
clc
input = [0,0;0,1;1,0;1,1];
t = [0;1;1;1];

w = [0;0];
b = 0;
% w = randn(2,1);
% b = randn;
eta = 0.05;

for i = 1:2
    out = 1./(1+exp(-(input * w + b)));
    err(i) = sum((out - t).^2);
    
%     dCdz = (out - t); %cross-enthalpy cost function
    dCdz = (out - t).*out.*(1-out); %quadratic cost funtion
    
    dw = (transpose(input)*dCdz)
    db = (ones(1,4)*dCdz)
    
    w = w - dw.*eta;
    b = b - db.*eta;
end
w
b