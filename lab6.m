%zad.1
clear;
og_img = imread('rzeczka.jpg');
og_img_double = og_img;

[rows, cols, chanels] = size(og_img);

og_img_margin = zeros(rows + 2, cols + 2,chanels);

og_img_margin(2:end-1, 2:end-1, :) = og_img_double;

%gora marginesu bez rogow
og_img_margin(1,2:end-1,:) = og_img_double(1,:,:); 

%dol marginesu bez rogow
og_img_margin(end,2:end-1,:) = og_img_double(end,:,:);

%lewa marginesu bez rogow
og_img_margin(2:end-1, 1, :) = og_img_double(1:end,1,:);

%prawa marginesu bez rogow
og_img_margin(2:end-1, end, :) = og_img_double(1:end,end,:);

%lewy gorny rog marginesu
og_img_margin(1,1,:) = og_img_double(1,1,:);

%lewy dolny rog marginesu
og_img_margin(end,1,:) = og_img_double(end,1,:);

%prawy gorny rog marginesu
og_img_margin(1,end,:) = og_img_double(1,end,:);

%prawy dolny rog marginesu
og_img_margin(end,end,:) = og_img_double(end,end,:);

maska = ones(3)/9;
