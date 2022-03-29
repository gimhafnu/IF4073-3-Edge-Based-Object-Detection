clear all;
clc;

f=imread('Picture1.png');
type = "Canny";
type = "Prewitt";
%type = "LoG";

figure, imshow(f); title('original image');
f_neo = clogp_bg_remove(f, type);
figure, imshow(f_neo); title(type + " removal");