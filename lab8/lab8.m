%zad.1
%{
clear;
pic = imread('rzeczka.jpg');
pic = double(pic);
s_wy = 333;
w_wy = 222;

[s_we,w_we,channels] = size(pic);
new_pic = zeros(s_wy, w_wy, channels);

for channel = 1:channels;
  for x_wy = 1:s_wy;
    for y_wy = 1:w_wy;
      x_we = round(1 + (x_wy - 1)*(s_we-1)/(s_wy-1));
      y_we = round(1 + (y_wy - 1)*(w_we-1)/(w_wy-1));
      new_pic(x_wy, y_wy, channel) = pic(x_we,y_we,channel);
    endfor
  endfor
endfor

new_pic = uint8(new_pic);
imwrite(new_pic, 'new_rzeczka.jpg');
%}

%zad.2
%{
clear;
pic = imread('rzeczka_mniejsza.jpg');
pic = double(pic);
s_wy = 1366;
w_wy =768;

[s_we,w_we,channels] = size(pic);
new_pic = zeros(s_wy,w_wy);

for channel = 1:channels;
  for x_wy = 1:s_wy;
    for y_wy = 1:w_wy;
      x_we = round(1 + (x_wy - 1)*(s_we-1)/(s_wy-1));
      y_we = round(1 + (y_wy - 1)*(w_we-1)/(w_wy-1));
      new_pic(x_wy, y_wy, channel) = pic(x_we,y_we,channel);
    endfor
  endfor
endfor

new_pic = uint8(new_pic);
imwrite(new_pic, 'new_rzeczka_mniejsza.jpg');
%}

%zad.3
%{
clear;
pic = imread('logo_linuxa.png');
pic = double(pic);

s_wy = 750;
w_wy = 640;

[s_we,w_we,channels] = size(pic);
new_pic = zeros(s_wy,w_wy);

for channel = 1:channels;
  for x_wy = 1:s_wy;
    for y_wy = 1:w_wy;
      x_we = round(1 + (x_wy - 1)*(s_we-1)/(s_wy-1));
      y_we = round(1 + (y_wy - 1)*(w_we-1)/(w_wy-1));
      new_pic(x_wy, y_wy, channel) = pic(x_we,y_we,channel);
    endfor
  endfor
endfor

new_pic = uint8(new_pic);
imwrite(new_pic, 'new_logo_linuxa.png');
%}

%zad.4
%{
clear;
pic = imread('zrzut_1.png');
pic = double(pic);

s_wy = 428;
w_wy = 905;

[s_we,w_we,channels] = size(pic);
new_pic = zeros(s_wy,w_wy);

for channel = 1:channels;
  for x_wy = 1:s_wy;
    for y_wy = 1:w_wy;
      x_we = round(1 + (x_wy - 1)*(s_we-1)/(s_wy-1));
      y_we = round(1 + (y_wy - 1)*(w_we-1)/(w_wy-1));
      new_pic(x_wy, y_wy, channel) = pic(x_we,y_we,channel);
    endfor
  endfor
endfor

new_pic = uint8(new_pic);
imwrite(new_pic, 'new_zrzut_1.png');
%}

