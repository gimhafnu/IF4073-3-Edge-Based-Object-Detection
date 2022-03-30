function image = laplacian8(n)

H = [1 1 1;
    1 -8 1;
    1 1 1];
J = conv2(double(n), double(H), 'same');
image = uint8(J);