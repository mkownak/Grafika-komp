%{
%zad.1
clear;
punkty = csvread('punktman.csv');
%scatter(punkty(:,1),punkty(:,2));

s_x = 0.1;
s_y = 0.2;

MacierzObrobki = skalowanie(s_x,s_y);

[rows,columns] = size(punkty);
new_punkty=zeros(rows,columns);

for cord = 1:rows;
  temp_matrix = [punkty(cord,1);punkty(cord,2);1];
  wynik_matrix = MacierzObrobki * temp_matrix;
  new_punkty(cord,1)=wynik_matrix(1);
  new_punkty(cord,2)=wynik_matrix(2);
endfor

figure;
scatter(punkty(:,1),punkty(:,2));

figure;
scatter(new_punkty(:,1),new_punkty(:,2));
%}


%{
%zad.2
clear;
punkty=csvread('punktman.csv');

mean_x = mean(punkty(:,1));
mean_y = mean(punkty(:,2));

MacierzObrobki=translacja(-mean_x, -mean_y);
%na minusie aby przesunac punkty do (0,0)

[rows,columns] = size(punkty);
new_punkty=zeros(rows,columns);

for cord = 1:rows;
  temp_matrix = [punkty(cord,1);punkty(cord,2);1];
  wynik_matrix = MacierzObrobki * temp_matrix;
  new_punkty(cord,1)=wynik_matrix(1);
  new_punkty(cord,2)=wynik_matrix(2);
endfor

figure;
scatter(punkty(:,1),punkty(:,2));

figure;
scatter(new_punkty(:,1),new_punkty(:,2));
%}

%{
%zad.3
clear;
punkty=csvread('punktman.csv');

obr = -60 * pi/180;
%obr = deg2rad(obr);

MacierzObrobki=obrot(obr)

[rows,columns] = size(punkty);
new_punkty=zeros(rows,columns);

for cord = 1:rows;
  temp_matrix = [punkty(cord,1);punkty(cord,2);1];
  wynik_matrix = MacierzObrobki * temp_matrix;
  new_punkty(cord,1)=wynik_matrix(1);
  new_punkty(cord,2)=wynik_matrix(2);
endfor

figure;
scatter(punkty(:,1),punkty(:,2));

figure;
scatter(new_punkty(:,1),new_punkty(:,2));
%}

%{
%zad.4
clear;
punkty=csvread('punktman.csv');
mean_x = mean(punkty(:,1));
mean_y = mean(punkty(:,2));

MacierzTranslacja = translacja(-mean_x, -mean_y);

obr = 90 * pi/180;
MacierzObrotu = obrot(obr);

MacierzSkalowania = skalowanie(0.01, 0.01);

MacierzObrobkiAll = MacierzSkalowania * MacierzObrotu * MacierzTranslacja;

[rows, columns] = size(punkty)
new_punkty = zeros(rows,columns);

for cord = 1:rows
  temp_matrix = [punkty(cord,1);punkty(cord,2);1];
  wynik_matrix = MacierzSkalowania * MacierzObrotu * MacierzTranslacja * temp_matrix;
  new_punkty(cord,1)=wynik_matrix(1);
  new_punkty(cord,2)=wynik_matrix(2);
endfor

figure;
scatter(punkty(:,1),punkty(:,2));

figure;
scatter(new_punkty(:,1),new_punkty(:,2));
%}

%{
%zad.5
clear;
punkty=csvread('punktman.csv');
%scatter(punkty(:,1),punkty(:,2));

min_x = min(punkty(:,1));
min_y = min(punkty(:,2));
%MacierzTranslacja1 = translacja(min_x, min_y);
MacierzTranslacja2 = translacja(-min_x, -min_y);
MacierzLustrzana = skalowanie(1,-1);
MacierzSkalowania = skalowanie(1, 0.5);

[rows,columns] = size(punkty);
new_punkty = zeros(rows,columns);

for cord = 1:rows;
  temp_matrix = [punkty(cord,1);punkty(cord,2);1];
  wynik_matrix = MacierzTranslacja2 * temp_matrix;
  new_punkty(cord,1)=wynik_matrix(1);
  new_punkty(cord,2)=wynik_matrix(2);
endfor

lustro_punkty = zeros(rows,columns);

for cord = 1:rows;
  temp_matrix = [new_punkty(cord,1);new_punkty(cord,2);1];
  wynik_matrix = MacierzSkalowania * MacierzLustrzana * temp_matrix;
  lustro_punkty(cord,1)=wynik_matrix(1);
  lustro_punkty(cord,2)=wynik_matrix(2);
endfor

figure;
scatter(punkty(:,1),punkty(:,2));

figure;
scatter(new_punkty(:,1),new_punkty(:,2));
hold on;
scatter(lustro_punkty(:,1), lustro_punkty(:,2));
%}


