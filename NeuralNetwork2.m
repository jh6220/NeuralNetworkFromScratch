clear
load('mnist_train.mat')
load('mnist_test.mat')

layers = [784,100,10];
s = struct;
for i = 1:(length(layers)-1)
    s(i).w = randn(layers(i+1),layers(i));
    s(i).b = randn(layers(i+1),1);
end

train = struct;
for i = 1:size(mnist_train,1)
    train(i).i = transpose(mnist_train(i,2:785))./253;
    train(i).t = zeros(10,1);
    train(i).t(mnist_train(i,1)+1) = 1;
end

test = struct;
for i = 1:size(mnist_test,1)
    test(i).i = transpose(mnist_test(i,2:785)./253);
    test(i).t = zeros(10,1);
    test(i).t(mnist_test(i,1)+1) = 1;
end



eta = 0.5;
N = 30;
n = 10;
m = length(train);
lambda = 5;
SR(1) = cost(s, test);
figure(1)
for i = 1:N
    data = train(randperm(length(train)));
    data = reshape(data,[n,length(data)/n]);
    
    for j = 1:size(data,2)
        ns = struct;
        for k = 1:(length(layers)-1)
            ns(k).w = zeros(layers(k+1),layers(k));
            ns(k).b = zeros(layers(k+1),1);
        end
        
        for k = 1:n
            dns = backprop(s, data(k,j).i, data(k,j).t);
            
            for l = 1:length(ns)
                ns(l).w = ns(l).w + dns(l).w;
                ns(l).b = ns(l).b + dns(l).b;
            end
        end
        
        for k = 1:length(s)
            s(k).w = s(k).w .*(1-eta*lambda/m) - ns(k).w .*(eta./n);
            s(k).b = s(k).b - ns(k).b .*(eta./n);
        end
    end
    SR(i+1) = cost(s, test);
    plot(SR)
    drawnow
end