function [SR] = cost_val(s, data)
S = 0;
for i = 1:length(data)
    a = data(i).i;
    for j = 1:length(s)
        z = s(j).w * a + s(j).b;
        a = sigmoid(z);
    end
    C = (a - data(i).t).^2;
    C = sum(C,'all');
    S = S + C
end
end

