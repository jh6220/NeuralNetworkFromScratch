function [] = visualise(n, A, t, w, b)
[valT, T] = max(t(:,n));
[valI, I] = max(feedforward(A(:,n), w, b));
A = transpose(reshape(A(:,n),[28,28]));
imagesc(A)
colormap gray
axis square
title("true: " + num2str(T - 1) + "; AI: " + num2str(I - 1));
end

