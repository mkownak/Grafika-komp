%{
%zad.1
clear;
punkty = csvread('punktman.csv');
%scatter(punkty(:,1),punkty(:,2));

s_x = 0.1;
s_y = 0.2;

MacierzObrobki=zeros(3,3);
MacierzObrobki(1,1) = s_x;
MacierzObrobki(2,2) = s_y;
MacierzObrobki(3,3) = 1;

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


%zad.2
%{
clear;
punkty=csvread('punktman.csv');

mean_x = mean(punkty(:,1));
mean_y = mean(punkty(:,2));

MacierzObrobki=zeros(3,3);
MacierzObrobki(1,1) = 1;
MacierzObrobki(2,2) = 1;
MacierzObrobki(3,3) = 1;
MacierzObrobki(1,3) = -mean_x; %na minusie aby przesunac punkty do (0,0)
MacierzObrobki(2,3) = -mean_y;

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

%zad.3
%{
clear;
punkty=csvread('punktman.csv');

obr = -60 * pi/180;
%obr = deg2rad(obr);

MacierzObrobki=zeros(3,3);
MacierzObrobki(1,1) = cos(obr);
MacierzObrobki(1,2) = -sin(obr);
MacierzObrobki(2,1) = sin(obr);
MacierzObrobki(2,2) = cos(obr);
MacierzObrobki(3,3) = 1;

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

%zad.4
punkty=csvread('punktman.csv');
MacierzObrobkiSkalowanie = skalowanie(1,2);
