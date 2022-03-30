function image = sobel(n)

Sx = [-1 0 1;
    -2 0 2;
    -1 0 1];
Sy = [1 2 1;
    0 0 0;
    -1 -2 -1];
Jx = conv2(double(n), double(Sx), 'same');
Jy = conv2(double(n), double(Sy), 'same');
Jedge = sqrt(Jx.^2 + Jy.^2);
image = uint8(Jedge);
