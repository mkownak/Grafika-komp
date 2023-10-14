% zad.1
aa = [1:-0.1:-0.9]

% zad.2
% ab = [1:3;11:13]
ab =[1:3:40;2.1:-0.1:0.8]
ac = ab'

% zad.3
% ad = [1:3;10:12]
% ad .*[1 2 3]

ae = [1:3;4:6;7:9]
aee = ae .*[1;100;10]

% zad.4
af = [1:3;4:6;7:9]
aff = af .* [1;0.1;10]'

% zad.5
ag = [11:1:20]
agg = ag > 15 & ag <= 18

% zad.6
ah = [1:2:41;2.1:0.2:6.1]
ahh = ah' * [1;1000]

% zad.7
% skip
m1=[3,1;-1 1]^-1
m2=[31;-9]
odp = m1 * m2
x1=odp(1)
x2=odp(end)

% zad.8
a = [1:3;4:6;7:9]
a(end-1:-1:1,:)

% zad.9
b = [1:3;4:6;7:9]
c=b;c(b > 2 & b < 5) = c(b > 2 & b < 5)+10

% zad.10
d=[1:3;4,5,4;7,8,5]
d-mean(d)

% zad.11
e = [1:3;4,5,4]
wymiary=size(e)
e2 = -1 + 2 * rand(wymiary(1), wymiary(2))

% zad.12
f = floor(5*rand(4,3))
for i = 1:size(f,1)
  for j = 2:size(f,2)
    f(i,j) = f(i,j) + f(i,j-1);
  end
end

% zad.12
g = [2,3,0,0;4,3,4,1;4,2,3,1]
for i = 1:size(g,1)
  for j = 1:size(g,2)
    if g(i,j) > 3
      g(i,j) = 0;
    endif
  endfor
 endfor5]
d-mean(d)
