function [pdw, pdb, err] = vector_single(A, w, b, t)
z = w*A + b;
a = 1/(1+exp(-z))
dCdz = (a-t)*a*(1-a);
pdb = dCdz;
pdw = dCdz*transpose(A);
err = ((a-t)^2)/2;
end

