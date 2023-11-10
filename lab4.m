%zad.1
%{
og_image = imread('rzeczka.jpg');
og_image_double = double(og_image);
g=1.5;

new_image = power(og_image_double/255, 1/g);
new_image = uint8(new_image*255);

function wyjscie = PrzytnijZakres(wejscie)
  if wejscie <= 0
    wyjscie = 0;
  elseif wejscie >= 255
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction

function wyjscie = porownanie_v_PS(we_stare, we_nowe)
  wyjscie = abs(we_nowe - we_stare)
endfunction

function wyjscie = porownanie_v_2(we_stare, we_nowe)
  wyjscie = PrzytnijZakres((we_nowe - we_stare)+127.5);
endfunction

function wyjscie = porownanie_v_PS_mnoz(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * abs(we_nowe - we_stare));
endfunction

function wyjscie = porownanie_v_2_mnoz(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * (we_nowe - we_stare) + 127.5);
endfunction

compare = porownanie_v_PS(double(og_image), double(new_image));
compare = uint8(compare);

compare_v2 = porownanie_v_2(double(og_image), double(new_image));
compare_v2 = uint8(compare_v2);

compare_PS_mnoz = porownanie_v_PS_mnoz(double(og_image), double(new_image), 4);
compare_PS_mnoz = uint8(compare_PS_mnoz);

compare_v2_mnoz = porownanie_v_2_mnoz(double(og_image), double(new_image), 3);
compare_v2_mnoz = uint8(compare_v2_mnoz);

figure;
subplot(2,2,1);
imshow(og_image);

subplot(2,2,2);
imshow(new_image);

subplot(2,2,3);
imshow(compare);

subplot(2,2,4);
imshow(compare_v2);

figure;
subplot(2,2,1);
imshow(og_image);

subplot(2,2,2);
imshow(new_image);

subplot(2,2,3);
title("PS * 4")
imshow(compare_PS_mnoz);

subplot(2,2,4);
title("v2 * 3")
imshow(compare_v2_mnoz);
%}

%zad.2
%{
clear
og_image = imread('rzeczka.jpg');
og_image_double = double(og_image);

[rows,cols,channels] = size(og_image_double);
obraz_srednia = zeros(rows,cols);
obraz_szary = zeros(rows,cols);

function wynik = SzaroscSrednia(r,g,b)
  wynik = (r+g+b)/3;
endfunction

function wynik = SzaroscSzary(r,g,b)
  wynik = 0.2126*r + 0.7152*g + 0.0722*b;
endfunction

for row = 1:rows
  for col = 1:cols
    r = og_image_double(row,col,1);
    g = og_image_double(row,col,2);
    b = og_image_double(row,col,3);

    srednia = SzaroscSrednia(r,g,b);
    obraz_srednia(row,col) = srednia;

    szary = SzaroscSzary(r,g,b);
    obraz_szary(row,col) = szary;
  endfor
endfor

obraz_srednia = uint8(obraz_srednia);
obraz_szary = uint8(obraz_szary);

figure;
subplot(1,2,1);
imshow(obraz_srednia);

subplot(1,2,2);
imshow(obraz_szary);
%}

%zad.3
%{
clear
og_image = imread('rzeczka.jpg');
og_image_double = double(og_image);

[rows,cols,channels] = size(og_image_double);
obraz_Y = zeros(rows,cols);
obraz_CB = zeros(rows,cols);
obraz_CR = zeros(rows,cols);

for row = 1:rows
  for col = 1:cols
    R = og_image_double(row,col,1);
    G = og_image_double(row,col,2);
    B = og_image_double(row,col,3);

    Y =  0.2999*R + 0.587*G + 0.114*B;
    CB = 128 - 0.168736*R - 0.331264*G + 0.5*B;
    CR = 128 + 0.5*R - 0.418688*G - 0.081312*B;

    obraz_Y(row,col) = Y;
    obraz_CB(row,col) = CB;
    obraz_CR(row,col) = CR;
  endfor
endfor

obraz_Y = uint8(obraz_Y);
obraz_CB = uint8(obraz_CB);
obraz_CR = uint8(obraz_CR);

figure;
subplot(2,2,1);

imshow(og_image);
title('RGB');

subplot(2,2,2);
imshow(obraz_Y);
title('Y');

subplot(2,2,3);
title('CB');
imshow(obraz_CB);
title("CB");

subplot(2,2,4);
imshow(obraz_CR);
title('CR');
%}

%zad.4
clear
og_image = imread('rzeczka.jpg');
og_image_double = double(og_image);

[rows,cols,channels] = size(og_image_double);
obraz_Y = zeros(rows,cols);
obraz_CB = zeros(rows,cols);
obraz_CR = zeros(rows,cols);

for row = 1:rows
  for col = 1:cols
    R = og_image_double(row,col,1);
    G = og_image_double(row,col,2);
    B = og_image_double(row,col,3);

    Y =  0.2999*R + 0.587*G + 0.114*B;
    CB = 128 - 0.168736*R - 0.331264*G + 0.5*B;
    CR = 128 + 0.5*R - 0.418688*G - 0.081312*B;

    obraz_Y(row,col) = Y;
    obraz_CB(row,col) = CB;
    obraz_CR(row,col) = CR;
  endfor
endfor

obraz_RGB = zeros(rows,cols,channels);

for row = 1:rows
    for col = 1:cols
      R = obraz_Y(row,col) + 1.402 * (obraz_CR(row,col) - 128);
      G = obraz_Y(row,col) - 0.344136 * (obraz_CB(row,col) - 128) - 0.714136 * (obraz_CR(row,col) - 128);
      B = obraz_Y(row,col) + 1.772 * (obraz_CB(row,col) - 128);

      obraz_RGB(row,col,1) = R;
      obraz_RGB(row,col,2) = G;
      obraz_RGB(row,col,3) = B;
    endfor
endfor

function wyjscie = PrzytnijZakres(wejscie)
  if wejscie <= 0
    wyjscie = 0;
  elseif wejscie >= 255
    wyjscie = 255;
  else
    wyjscie = wejscie;
  endif
endfunction

function wyjscie = porownanie_v_PS_mnoz(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * abs(we_nowe - we_stare));
endfunction

function wyjscie = porownanie_v_2_mnoz(we_stare, we_nowe, mnoznik)
  wyjscie = PrzytnijZakres(mnoznik * (we_nowe - we_stare) + 127.5);
endfunction

obraz_RGB = uint8(obraz_RGB);
compare_ps = porownanie_v_PS_mnoz(og_image_double, double(obraz_RGB), 1000000);
compare_v2 = porownanie_v_2_mnoz(og_image_double, double(obraz_RGB), 1000000);

compare_ps = uint8(compare_ps)
compare_v2 = uint8(compare_v2)

figure;
subplot(2,2,1)
imshow(og_image);
title('og');

subplot(2,2,2);
imshow(obraz_RGB);
title('YCBCR to RGB');

subplot(2,2,3);
imshow(compare_ps);
title('porowanie PS * 1000000');

subplot(2,2,4);
imshow(compare_v2);
title('porowanie v2 * 1000000');
