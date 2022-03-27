clear all;
clc;

f=imread('bananas_2_touching.jpg');
figure, imshow(f); title('original image');
f_log = LoG_edge_detect(f);
figure, imshow(f_log); title('LoG image');
f_prewitt = Prewitt_edge_detect(f);
figure, imshow(f_prewitt); title('Prewitt image');
f_canny = Canny_edge_detect(f);
figure, imshow(f_canny); title('Canny image');