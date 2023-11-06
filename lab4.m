%zad.1
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

compare = porownanie_v_PS(double(og_image), double(new_image));
compare = uint8(compare);

compare_v2 = porownanie_v_2(double(og_image), double(new_image));
compare_v2 = uint8(compare_v2);

figure;
subplot(2,2,1);
imshow(og_image);

subplot(2,2,2);
imshow(new_image);

subplot(2,2,3);
imshow(compare);

subplot(2,2,4);
imshow(compare_v2);
