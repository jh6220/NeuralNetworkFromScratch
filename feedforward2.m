function [a] = feedforward2(s, x)
a = x;
for i = 1:length(s)
    z = s(i).w * a + s(i).b;
    a = sigmoid(z);
end
end

