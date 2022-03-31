function image = roberts(n)
Rx = [1 0; 0 -1];
Ry = [0 1; -1 0];
Jx = conv2(double(n), double(Rx), 'same');
Jy = conv2(double(n), double(Ry), 'same');
Jedge = sqrt(Jx.^2 + Jy.^2);
image = uint8(Jedge);