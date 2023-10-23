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

% Plot the RGB histogram
subplot(2, 2, 1);
hist(vector_rgb, 100);
title('R+G+B');

% Plot the Red channel histogram
subplot(2, 2, 2);
hist(vector_r, 100);
title('R');

% Plot the Green channel histogram
subplot(2, 2, 3);
hist(vector_g, 100);
title('G');

% Plot the Blue channel histogram
subplot(2, 2, 4);
hist(vector_b, 100);
title('B');
%}

%zad.3
clear
orginal_img=imread('plaza1.png');
orginal_img_double=double(orginal_img);
we_min = min(reshape(orginal_img(:,:,3),1,[]));
we_max = max(reshape(orginal_img(:,:,3),1,[]));

new_image = (orginal_img - we_min) * (255/(we_max-we_min));

figure;
imshow(orginal_img);

figure;
imshow(new_image);

figure;
vector_rgb = reshape(new_image,1,[]);
hist(vector_rgb,100);
title("R+G+B");

figure;
vector_r = reshape(new_image(:,:,1),1,[]);
hist(vector_r,100);
title("R");

figure;
vector_g = reshape(new_image(:,:,2),1,[]);
hist(vector_g,100);
title("G");

figure;
vector_b = reshape(new_image(:,:,3),1,[]);
hist(vector_b,100);
title("B");
