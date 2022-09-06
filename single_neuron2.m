clear
eta = 0.05;
w = [0,0];
b = [0];

input = [0,0,1,1;0,1,0,1];
t = [0,1,1,1];

for i = 1:10000
    dw = [0,0];
    db = [0];
    err = 0;
    for j = 1:length(t)
        [pdw, pdb, derr] = vector_single(input(:,j), w, b, t(j));
        dw = dw + pdw;
        db = db + pdb;
        err = err + derr;
    end
    E(i) = err;
    w = w - dw.*eta;
    b = b - db.*eta;
end
plot(E)