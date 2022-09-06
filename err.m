function [C] = err(A, w, b, t)
C = 0;
for i = 1:size(A,2)
    AL = feedforward(A(:,i), w, b);
    [val1, index1] = max(AL);
    [val2, index2] = max(t(:,i));
    if (index1 == index2)
        C = C + 1;
    end
end
C = C*100/size(A,2);
end

