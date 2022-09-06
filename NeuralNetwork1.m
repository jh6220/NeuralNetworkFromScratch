clear
clc
load('mnist_train.mat')
load('mnist_test.mat')


t_train = zeros(10, size(mnist_train,1));
i_train = zeros(784, size(mnist_train,1));
for i = 1:size(mnist_train,1)
    t_train(mnist_train(i,1)+1,i) = 1;
    i_train(:,i) = transpose(mnist_train(i,2:785));
end

t_test = zeros(10, size(mnist_test,1));
i_test = zeros(784, size(mnist_test,1));
for i = 1:size(mnist_test,1)
    t_test(mnist_test(i,1)+1,i) = 1;
    i_test(:,i) = transpose(mnist_test(i,2:785));
end

layers = [784,30,10];
eta = 3;
w = cell(1,length(layers)-1);
b = cell(1,length(layers)-1);
for i = 1:(length(layers)-1)
    w{i} = randn(layers(i+1),layers(i));
    b{i} = randn(layers(i+1),1);
end

% A = [[1;0;1;2;3],[2;1;0;1;2],[3;2;1;0;1]];
% t = [[1;0;0],[0;1;0],[0;0;1]];
A = i_train;
t = t_train;

n = 10;
N = 30;
E = zeros(1,N);
C(1) = err(A, w, b, t)
for i = 1:N
    index = randperm(size(A,2));
    for j = 1:n:size(A,2)
        dw = cell(1,length(layers)-1);
        db = cell(1,length(layers)-1);
        for l = 1:(length(layers)-1)
            dw{l} = zeros(layers(l+1),layers(l));
            db{l} = zeros(layers(l+1),1);
        end
        for k = 1:n
            [pdw,pdb] = vector(t(:,index(j+k-1)), w, b, A(:,index(j+k-1)));
%             if any(isnan(pdb{2}))
%                 error('error')
%             end
            for m = 1:length(pdb)
                dw{m} = dw{m} + pdw{m};
                db{m} = db{m} + pdb{m};
            end
        end
%         db{2}
%         pause()
        for o = 1:length(pdb)
            w{o} = w{o} - dw{o}.*(eta/n);
            b{o} = b{o} - db{o}.*(eta/n);
        end
%         if any(isnan(b{2}))
%             error()
%         end
    end
    C(i+1) = err(i_test, w, b, t_test);
%     C(i+1)
    plot(C)
    drawnow
end