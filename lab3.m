%zad.1
%{
clear;
og_image=imread("rzeczka2.png");
og_image_double=double(og_image);
g=0.7;
new_image=power(og_image_double/255, 1/g);
new_image=uint8(new_image*255);

figure;
imshow(og_image);

figure;
imshow(new_image);

figure;
x=linspace(0,1,1000);
y=power(x,1/g);
plot(x,y);
%}

%zad.2
%{
clear;
og_image=imread("rzeczka2.png");
og_image_double=double(og_image);
g=1.5;
new_image=power(og_image_double/255, 1/g);
new_image=uint8(new_image*255);

figure;
imshow(og_image);

figure;
imshow(new_image);

figure;
x=linspace(0,1,1000);
y=power(x,1/g);
plot(x,y);
%}

%zad.3
%{
clear;
og_image=imread("rzeczka2.png");
og_image_double=double(og_image);

function wyjscie = PrzytnijZakres(wejscie)
  if wejscie <= 0
    wyjscie = 0;
  elseif wejscie >= 255
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction

function wyjscie = ZmienJasnosc(wejscie, wspJasnosci)
 wyjscie = wejscie + wspJasnosci;
 wyjscie = PrzytnijZakres(wyjscie)
end

new_image = ZmienJasnosc(og_image_double,-50);
new_image = uint8(new_image);

figure;
imshow(og_image);

figure;
imshow(new_image);
%}

%zad.4
% kompilacja tego kodu masakruje kod na 5 sekund
%{
clear;
og_image=imread("rzeczka2.png");
og_image_double=double(og_image);

function wyjscie = PrzytnijZakres(wejscie)
  if wejscie <= 0
    wyjscie = 0;
  elseif wejscie >= 255
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction

LUT = zeros(1,256);

for i = 0:255
  wyjscie = i + 50;
  LUT(i+1) = PrzytnijZakres(wyjscie);
end

function wyjscie = LUT_zastosuj(wejscie, LUT)
    wejscie(wejscie < 0) = 0;
    wejscie(wejscie > 255) = 255;

    zaokraglone_wejscie = round(wejscie);

    wyjscie = LUT(zaokraglone_wejscie + 1);
end

new_image = LUT_zastosuj(og_image_double,LUT);
new_image = uint8(new_image);

figure;
imshow(og_image);

figure;
imshow(new_image);
%}

%zad.5
clear;
og_image=imread("rzeczka2.png");
og_image_double=double(og_image);

function wyjscie = LUT_zastosuj(wejscie, LUT)
    wejscie(wejscie < 0) = 0;
    wejscie(wejscie > 255) = 255;

    zaokraglone_wejscie = round(wejscie);

    wyjscie = LUT(zaokraglone_wejscie + 1);
end

LUT = zeros(1,256);
wejscie = (0:255) / 255;
g = 1.5;

wyjscie = power(wejscie, 1/g);
LUT=round(wyjscie * 255);

new_image=LUT_zastosuj(og_image_double,LUT);
new_image=uint8(new_image);

figure;
imshow(og_image);

figure;
imshow(new_image);
