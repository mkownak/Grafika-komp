%zad4_lab3

clear;
%clf;
%{
og_image = imread('rzeczka_mniejsza.jpg');
og_image_double = double(og_image);

LUT = zeros(1,256);

for i = 0:255;
  LUT(i+1) = PrzytnijZakres(i+50);
end

new_image = zastosuj_LUT(og_image_double, LUT);
new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(new_image);
title('new');
%}

%zad1_lab2
%{
clear;
%clf;
og_image = imread('rzeczka_mniejsza.jpg');
og_image_double = double(og_image);

new_image=og_image_double;
new_image(:,:,1)=og_image_double(:,:,3);
new_image(:,:,3)=og_image_double(:,:,1);
new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(new_image);
title('swap')'
%}

%zad2_lab2
%{
clear;
og_image = imread('rzeczka_mniejsza.jpg');
og_image_double = double(og_image);

vector_rgb = vec(og_image_double);
vector_rgb = vector_rgb';

vector_r = vec(og_image_double(:,:,1));
vector_r = vector_r';

vector_g = vec(og_image_double(:,:,2));
vector_g = vector_g';

vector_b = vec(og_image_double(:,:,3));
vector_b = vector_b';

figure;
subplot(2,2,1)
hist(vector_rgb,100);
title('RGB');

subplot(2,2,2)
hist(vector_r,100);
title('R');

subplot(2,2,3)
hist(vector_g,100);
title('G');

subplot(2,2,4)
hist(vector_b,100);
title('B');
%}

%zad3_lab2
%{
clear;
og_image = imread('plaza1.png');
og_image_double = double(og_image);

vector_rgb = vec(og_image_double)';
we_min = min(vector_rgb);
we_max = max(vector_rgb);

scaled_image = ((og_image_double - we_min)/(we_max - we_min)) * (255-0) + 0;
scaled_image = uint8(scaled_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(scaled_image);
title('scaled');
%}

%zad5_lab3
%{
clear;
og_image = imread('rzeczka2.png');
og_image_double = double(og_image);


LUT=zeros(1,256);
wejscie = (0:255)/255;

wyjscie = power(wejscie,1/1.5);
LUT = round(wyjscie * 255);

new_image = zastosuj_LUT(og_image_double,LUT);
new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(new_image);
title('lut z gamma 1.5');
%}

%zad6_lab3
%{
clear;
og_image = imread('rzeczka2.png');
og_image_double = double(og_image);

wspKontrastu=60;

wspMN = power((255+wspKontrastu)/255,2);

LUT = zeros(1,256);

for i = 0:255;
  LUT(i+1) = PrzytnijZakres(127.5 + (i - 127.5) * wspMN),
endfor

new_image = zastosuj_LUT(og_image_double, LUT);
new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(new_image);
title('og + 60');
%}

%zad7_lab3
clear;
og_image = imread('rzeczka2.png');
og_image_double = double(og_image);

LUT_red = zeros(1, 256);
LUT_green = zeros(1,256);
LUT_blue = zeros(1,256);

for i = 0:60
  LUT_red(i+1) = i*2;
endfor

for i= 61:110
  LUT_red(i+1) = LUT_red(i) - 0.2;
endfor

for i = 111:255;
  LUT_red(i+1) = i+1;
endfor

for i = 0:255
  LUT_green(i+1)=i;
endfor

for i = 50:255
  LUT_blue(i+1)=((i)-50)*1.25;
endfor

figure;
hold on;
plot(0:255, LUT_red, 'color', 'r');
plot(0:255, LUT_green, 'color', 'g');
plot(0:255, LUT_blue, 'color','b');


new_image = og_image_double;
new_image(:,:,1) = zastosuj_LUT(new_image(:,:,1),LUT_red)
new_image(:,:,2) = zastosuj_LUT(new_image(:,:,2),LUT_green)
new_image(:,:,3) = zastosuj_LUT(new_image(:,:,3),LUT_blue)
new_image=uint8(new_image);

figure;
subplot(1,2,1);
imshow(og_image);
title('og');

subplot(1,2,2);
imshow(new_image);
title('trans');

