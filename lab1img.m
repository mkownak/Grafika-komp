

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
% Load your image
originalImage = imread('rzeczka.jpg');

% Get the dimensions of the original image
[rows, cols, channels] = size(originalImage);

% Create an empty matrix to store the mirrored image
mirroredImage = zeros(rows, cols, channels, class(originalImage));

% Mirror the image by copying pixels in reverse order along the horizontal axis
for i = 1:rows
    for j = 1:cols
        mirroredImage(i, j, :) = originalImage(i, cols - j + 1, :);
    end
end

% Display the mirrored image
#imshow(mirroredImage);
new_image=[originalImage,mirroredImage]
imshow(new_image)
