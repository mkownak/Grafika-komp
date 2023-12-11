clear;
punkty = csvread('punktman.csv');
#scatter(punkty(:,1),punkty(:,2));

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
