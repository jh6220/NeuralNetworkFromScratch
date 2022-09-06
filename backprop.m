function [dns] = backprop(s, x, y)
dns = struct;
for k = 1:(length(s))
    dns(k).w = zeros(size(s(k).w));
    dns(k).b = zeros(size(s(k).b));
end
a{1} = x;
for i = 1:length(s)
    z = s(i).w*a{i} + s(i).b;
    a{i+1} = sigmoid(z);
end
% dCdz = (a{end} - y) .* a{end} .* (1 - a{end});
dCdz = (a{end} - y);
dns(end).w  = dCdz*transpose(a{end-1});
dns(end).b  = dCdz;
for i = 1:(length(s)-1)
    dCdz = a{end-i} .* (1 - a{end-i}) .* (transpose(s(end+1-i).w)*dCdz);
    dns(end-i).b = dCdz;
    dns(end-i).w = dCdz*transpose(a{end-1-i});
end
end

