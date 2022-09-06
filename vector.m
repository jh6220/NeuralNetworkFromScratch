function [dw,db] = vector(t, w, b, A)
a{1} = A;
for i = 1:length(b)
    a{i+1} = w{i}*a{i} + b{i};
    a{i+1} = sigmoid(a{i+1});
end
dCda = (a{length(b)+1}-t);
dadz = a{length(b)+1}.*(1-a{length(b)+1});
db = cell(1,length(b));
dw = cell(1,length(w));
S = 0;
db{length(b)} = dadz.*dCda;
S = S + sum(db{length(b)}.^2,'all');
dw{length(w)} = (dadz.*dCda)*transpose(a{length(a)-1});
S = S + sum(dw{length(b)}.^2,'all');
for i = 1:(length(b)-1)
    dCda = transpose(w{length(b)+1-i})*(dCda.*dadz);
    dadz = a{length(b)+1-i}.*(1-a{length(b)+1-i});
    db{length(b)-i} = dadz.*dCda;
    S = S + sum(db{length(b)-i}.^2,'all');
    dw{length(w)-i} = (dadz.*dCda)*transpose(a{length(a)-1-i});
    S = S + sum(dw{length(b)-i}.^2,'all');
end
S = sqrt(S);
if (S < 2^(-10))
    S = 1;
end
for i = 1:length(db)
    db{i} = db{i}./S;
    dw{i} = dw{i}./S;
end
end

