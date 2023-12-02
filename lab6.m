%zad.1,2
%{
clear;
og_img = imread('rzeczka.jpg');
og_img_double = double(og_img);

[rows, cols, chanels] = size(og_img);

og_img_margin = zeros(rows + 2, cols + 2);
og_img_double_red = og_img_double(:,:,1);

og_img_margin(2:end-1, 2:end-1) = og_img_double_red;

%gora marginesu bez rogow
og_img_margin(1,2:end-1) = og_img_double_red(1,:);

%dol marginesu bez rogow
og_img_margin(end,2:end-1) = og_img_double_red(end,:);

%lewa marginesu bez rogow
og_img_margin(2:end-1, 1) = og_img_double_red(1:end,1);

%prawa marginesu bez rogow
og_img_margin(2:end-1, end) = og_img_double_red(1:end,end);

%lewy gorny rog marginesu
og_img_margin(1,1) = og_img_double_red(1,1);

%lewy dolny rog marginesu
og_img_margin(end,1) = og_img_double_red(end,1);

%prawy gorny rog marginesu
og_img_margin(1,end) = og_img_double_red(1,end);

%prawy dolny rog marginesu
og_img_margin(end,end) = og_img_double_red(end,end);

maska = [5,6,5;6,6,6;5,6,5]/50;

img_masked = zeros(rows,cols);

for row = 1:rows
  for col = 1:cols
    suma = og_img_margin(row,col) * maska(1,1)...
    + og_img_margin(row,col+1) * maska(1,2)...
    + og_img_margin(row,col+2) * maska(1,3)...
    + og_img_margin(row+1,col) * maska(2,1)...
    + og_img_margin(row+1,col+1) * maska(2,2)...
    + og_img_margin(row+1,col+2) * maska(2,3)...
    + og_img_margin(row+2,col) * maska(3,1)...
    + og_img_margin(row+2,col+1) * maska(3,2)...
    + og_img_margin(row+2,col+2) * maska(3,3);
    img_masked(row,col) = suma;
  endfor
endfor

figure;
subplot(1,2,1)
imshow(og_img_double_red/255)

subplot(1,2,2)
imshow(img_masked/255);
%}

%zad.3
clear;
og_img = imread('rzeczka.jpg');
og_img_double = double(og_img);

[rows, cols, chanels] = size(og_img);

og_img_margin = zeros(rows + 2, cols + 2, chanels);

og_img_margin(2:end-1, 2:end-1, :) = og_img_double;

%gora marginesu bez rogow
og_img_margin(1,2:end-1,:) = og_img_double(1,:,:);

%dol marginesu bez rogow
og_img_margin(end,2:end-1,:) = og_img_double(end,:,:);

%lewa marginesu bez rogow
og_img_margin(2:end-1, 1,:) = og_img_double(1:end,1,:);

%prawa marginesu bez rogow
og_img_margin(2:end-1, end,:) = og_img_double(1:end,end,:);

%lewy gorny rog marginesu
og_img_margin(1,1,:) = og_img_double(1,1,:);

%lewy dolny rog marginesu
og_img_margin(end,1,:) = og_img_double(end,1,:);

%prawy gorny rog marginesu
og_img_margin(1,end,:) = og_img_double(1,end,:);

%prawy dolny rog marginesu
og_img_margin(end,end,:) = og_img_double(end,end,:);

mask = [0,-1,0;-1,5,-1;0,-1,0];

img_masked = zeros(rows,cols,chanels);

for chanel = 1:chanels
  for row = 1:rows
    for col = 1:cols
      suma = og_img_margin(row,col,chanel) * mask(1,1)...
    + og_img_margin(row,col+1,chanel) * mask(1,2)...
    + og_img_margin(row,col+2,chanel) * mask(1,3)...
    + og_img_margin(row+1,col,chanel) * mask(2,1)...
    + og_img_margin(row+1,col+1,chanel) * mask(2,2)...
    + og_img_margin(row+1,col+2,chanel) * mask(2,3)...
    + og_img_margin(row+2,col,chanel) * mask(3,1)...
    + og_img_margin(row+2,col+1,chanel) * mask(3,2)...
    + og_img_margin(row+2,col+2,chanel) * mask(3,3);
    img_masked(row,col,chanel) = suma;
    endfor
  endfor
endfor

function wyjscie = PrzytnijZakres (wejscie)
  if wejscie <= 0
    wyjscie = 0;
  elseif wejscie >= 255
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction

img_masked_cut = PrzytnijZakres(img_masked);
img_masked_cut = uint8(img_masked_cut);

figure;
subplot(1,2,1);
imshow(og_img);

subplot(1,2,2);
imshow(img_masked_cut);
