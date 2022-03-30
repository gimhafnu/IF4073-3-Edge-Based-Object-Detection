function image = biner(img)

[m, n] = size(img);
X = zeros(m,n, 'uint8');
for i = 1:m
    for j = 1:n
        if img(m,n) ~= 0
            X(m,n) = 255;
        end
    end
end
image = X;
