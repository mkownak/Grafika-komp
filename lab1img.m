

% zad.1
img_uint8=imread('rzeczka.jpg');

img_uint8(:,10:50,1)=255;
img_uint8(:,10:50,2)=255;
img_uint8(:,10:50,3)=0;

imshow(img_uint8);

% zad.3
clear
img_uint8=imread('rzeczka.jpg')
negatyw=255-img_uint8;
imshow(negatyw);

% zad.2
