Img = imread('apple.jpeg');
I = rgb2gray(Img);

S = sobel(I);
R = roberts(I);
L4 = laplacian4(I);
L8 = laplacian8(I);

bw = imbinarize(L4,0.001);
bw = bwareaopen(bw, 1000);
bw = imfill(bw, 'holes');

% [X, Y,Z]  = size(Img);
% r1=Img(:,:,1);
% g1=Img(:,:,2);
% b1=Img(:,:,3);
% for i = 1:X
%     for j = 1:Y
%         if bw(X,Y) ~= 1
%             r1(X, Y) = 0;
%             g1(X, Y) = 0;
%             b1(X, Y) = 0;
%         end
%     end
% end
% d=cat(3,r1,g1,b1);
imshow(bw);