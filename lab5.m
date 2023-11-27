%zad.1
clear;

og_img = imread('rzeczka_mniejsza.jpg');
og_img_double = double(og_img);
og_img_double_scaled = og_img_double/255;

R = og_img_double_scaled(:,:,1);
G = og_img_double_scaled(:,:,2);
B = og_img_double_scaled(:,:,3);

MaxRGB = max(og_img_double_scaled, [], 3);
MinRGB = min(og_img_double_scaled, [], 3);

Chroma = MaxRGB - MinRGB;

H_temp = zeros(size(og_img,1) , size(og_img, 2));
red_condition = R == MaxRGB & Chroma>0.001;
green_condition = G == MaxRGB & Chroma>0.001;
blue_condition = B == MaxRGB & Chroma>0.001;

H_temp(red_condition) = mod( (G(red_condition)-B(red_condition))./Chroma(red_condition),6 );
H_temp(green_condition) = ((B(green_condition)-R(green_condition))./Chroma(green_condition))+2
H_temp(blue_condition) = ((R(blue_condition)-G(blue_condition))./Chroma(blue_condition))+4

H=H_temp * 60;

L = (MaxRGB + MinRGB)/2;


S = zeros(size(og_img,1) , size(og_img, 2));

zero_condition = L <= 0.001 | L >= 0.999;

S = Chroma./(1-abs(2*L-1));
S(zero_condition) = 0;

figure;
subplot(2,2,1);
imshow(og_img);

subplot(2,2,2);
imshow(H/360);

subplot(2,2,3);
imshow(S);

subplot(2,2,4);
imshow(L);
