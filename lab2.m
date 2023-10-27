%zad.1
orginal_img=imread('plaza1.png');
% imshow(orginal_img);
% imshow(orginal_img(:,:,:))

swap_img = orginal_img;

swap_img(:,:,3) = orginal_img(:,:,1);
swap_img(:,:,1) = orginal_img(:,:,3);

% imshow(swap_img);

%zad.2
%{
clear
orginal_img=imread('plaza1.png');

figure;
vector_rgb = reshape(orginal_img,1,[]);
hist(vector_rgb,100);
title("R+G+B");

figure;
vector_r = reshape(orginal_img(:,:,1),1,[]);
hist(vector_r,100);
title("R");

figure;
vector_g = reshape(orginal_img(:,:,2),1,[]);
hist(vector_g,100);
title("G");

figure;
vector_b = reshape(orginal_img(:,:,3),1,[]);
hist(vector_b,100);
title("B");


subplot(2, 2, 1);
hist(vector_rgb, 100);
title('R+G+B');

subplot(2, 2, 2);
hist(vector_r, 100);
title('R');

subplot(2, 2, 3);
hist(vector_g, 100);
title('G');

subplot(2, 2, 4);
hist(vector_b, 100);
title('B');
%}

%zad.3
%{
clear
orginal_img=imread('plaza1.png');
orginal_img_double=double(orginal_img);
we_min = min(reshape(orginal_img_double(:,:,:),1,[]));
we_max = max(reshape(orginal_img_double(:,:,:),1,[]));

new_image = (orginal_img_double - we_min)/(we_max-we_min) * (255-0) + 0
new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(orginal_img);

subplot(1,2,2);
imshow(new_image);

figure;
subplot(2,2,1);
vector_rgb = reshape(new_image,1,[]);
hist(vector_rgb,100);
title("R+G+B");

subplot(2,2,2);
vector_r = reshape(new_image(:,:,1),1,[]);
hist(vector_r,100);
title("R");

subplot(2,2,3)
vector_g = reshape(new_image(:,:,2),1,[]);
hist(vector_g,100);
title("G");

subplot(2,2,4)
vector_b = reshape(new_image(:,:,3),1,[]);
hist(vector_b,100);
title("B");
%}

%zad.4
%{
clear
orginal_img=imread('plaza1.png');
orginal_img_double=double(orginal_img);

we_min_r = min(reshape(orginal_img_double(:,:,1),1,[]));
we_max_r = max(reshape(orginal_img_double(:,:,1),1,[]));

we_min_g = min(reshape(orginal_img_double(:,:,2),1,[]));
we_max_g = max(reshape(orginal_img_double(:,:,2),1,[]));

we_min_b = min(reshape(orginal_img_double(:,:,3),1,[]));
we_max_b = max(reshape(orginal_img_double(:,:,3),1,[]));

new_image=orginal_img_double

% new_image = (orginal_img_double - we_min)/(we_max-we_min) * (255-0) + 0
new_image(:,:,1) = (orginal_img_double(:,:,1) - we_min_r)/(we_max_r - we_min_r) * (255-0) + 0;
new_image(:,:,2) = (orginal_img_double(:,:,2) - we_min_g)/(we_max_g - we_min_g) * (255-0) + 0;
new_image(:,:,3) = (orginal_img_double(:,:,3) - we_min_b)/(we_max_b - we_min_b) * (255-0) + 0;

new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(orginal_img);

subplot(1,2,2);
imshow(new_image);

figure;
subplot(2,2,1);
vector_rgb = reshape(new_image,1,[]);
hist(vector_rgb,100);
title("R+G+B");

subplot(2,2,2);
vector_r = reshape(new_image(:,:,1),1,[]);
hist(vector_r,100);
title("R");

subplot(2,2,3)
vector_g = reshape(new_image(:,:,2),1,[]);
hist(vector_g,100);
title("G");

subplot(2,2,4)
vector_b = reshape(new_image(:,:,3),1,[]);
hist(vector_b,100);
title("B");
%}

%Zad.5
clear
orginal_img=imread('plaza1.png');
orginal_img_double=double(orginal_img);

vector_double = reshape(orginal_img_double(:,:,:),1,[]);

vector_double_sorted = sort(vector_double);

we_min = round(prctile(vector_double_sorted,10));
we_max = round(prctile(vector_double_sorted,90));

% new_image = (orginal_img_double - we_min)/(we_max-we_min) * (255-0) + 0
new_image = (orginal_img_double - we_min)/(we_max-we_min) * (255-0) + 0;

new_image = uint8(new_image);

figure;
subplot(1,2,1);
imshow(orginal_img);

subplot(1,2,2);
imshow(new_image);

figure;
subplot(2,2,1);
vector_rgb = reshape(new_image,1,[]);
hist(vector_rgb,100);
title("R+G+B");

subplot(2,2,2);
vector_r = reshape(new_image(:,:,1),1,[]);
hist(vector_r,100);
title("R");

subplot(2,2,3)
vector_g = reshape(new_image(:,:,2),1,[]);
hist(vector_g,100);
title("G");

subplot(2,2,4)
vector_b = reshape(new_image(:,:,3),1,[]);
hist(vector_b,100);
title("B");
