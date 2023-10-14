%zad.1
clear
x = linspace(-pi, pi, 100);

hold on;
plot(x, abs(sin(x)));
plot(x, atan(x));
hold off;

xlabel('IKSY');
ylabel('IGREKI');
title('Bardzo wazny wykres');
legend('abs(sin(x))', 'atan(x)');
