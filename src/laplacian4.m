function image = laplacian4(n)

H = [0 1 0;
    1 -4 1;
    0 1 0];
J = conv2(double(n), double(H), 'same');
image = uint8(J);