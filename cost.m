function [SR] = cost(s, data)
S = 0;
for i = 1:length(data)
    a = data(i).i;
    for j = 1:length(s)
        z = s(j).w * a + s(j).b;
        a = sigmoid(z);
    end
    [val1, index1] = max(data(i).t);
    [val2, index2] = max(a);
    if (index1 == index2)
        S = S + 1;
    end
end
SR = S/length(data)*100;
end

