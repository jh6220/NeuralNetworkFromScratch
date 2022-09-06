load('mnist_train.mat')
load('mnist_test.mat')

image = reshape(mnist_train(100,2:785),[28,28]);
image = transpose(image);
imagesc(image)
axis square