function [a] = feedforward(a, w, b)
for i = 1:length(b)
    a = w{i}*a + b{i};
    a = sigmoid(a);
end
end

