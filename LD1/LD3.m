% LD3 Vismuntas Skarbalius EEF-25/2 09-23

clc;
clear;
close all;

%% a f(x) = x^3 + tan(x)

x = 0:0.1:2*pi;
y = x.^3 + tan(x);

figure;

plot(x,y,'bo','MarkerSize',4);

grid on;
box on;

xlabel('x','FontSize',12);
ylabel('f(x)','FontSize',12);

title('f(x) = x^3 + tan(x)');

legend('f(x) = x^3 + tan(x)', ...
    'Location','best');

% x ribos pagal min max x
xlim([min(x) max(x)]);

% y ribos, kad grafikas del tangento singuliarumo neiskryptu
ylim([-100 100]);

%% b 3 eksp f-jos

x = 0:0.1:2*pi;

y1 = exp(x);
y2 = exp(3*x);
y3 = exp(5*x);

figure;

% y asis leis matyt visas f-jas aiskiai
semilogy(x,y1,'r','LineWidth',1.5);
hold on;

semilogy(x,y2,'b','LineWidth',1.5);

semilogy(x,y3,'g','LineWidth',1.5);

grid on;
box on;

xlabel('x','FontSize',12);
ylabel('f(x)','FontSize',12);

title('eksp funkciju grafikai');

legend('f(x) = e^x', ...
    'f(x) = e^{3x}', ...
    'f(x) = e^{5x}', ...
    'Location','northwest');

% x ribos pagal min max x
xlim([min(x) max(x)]);

% y ribos pagal min max y
ylim([min([y1 y2 y3]) max([y1 y2 y3])]);

hold off;

%% 2 uzd 
% 6 studentai
studentai = 1:6;

% 4 egzaminu rezultatai
egz1 = [8 7 9 6 10 8];
egz2 = [7 8 8 7 9 7];
egz3 = [9 6 10 8 8 9];
egz4 = [6 9 7 9 8 10];

% Duomenu matrica
duomenys = [egz1; egz2; egz3; egz4]';

%% a

figure;

bar(studentai, duomenys);

grid on;
box on;

xlabel('Studentai');
ylabel('Ivertinimas');
title('Studentu egzaminu rezultatai');

legend('1 egzaminas', ...
    '2 egzaminas', ...
    '3 egzaminas', ...
    '4 egzaminas');

xticks(1:6);
yticks(0:1:10);

xlim([0.5 6.5]);
ylim([0 10]);

%% b

figure;

bar(studentai, duomenys, 'stacked');

grid on;
box on;

xlabel('Studentai');
ylabel('Ivertinimu suma');
title('Studentu egzaminu rezultatai');

legend('1 egzaminas', ...
    '2 egzaminas', ...
    '3 egzaminas', ...
    '4 egzaminas');

xticks(1:6);
xlim([0.5 6.5]);
ylim([0 35]);

%% pap uzd 7var

% laiko intervalas
t = 0:0.001:2;

% u0 signalas
U = 5*sin(2*pi*2*t) + ...
    1.2*sin(2*pi*15*t) + ...
    0.5*sin(2*pi*35*t);

% filtruotas signalas
U_filtruotas = 5*sin(2*pi*2*t);

% filtr ribos
U1 = 4;
U2 = -4;

%% sign grafikai

figure;

% 2 grafikai vienas salia kito
tiledlayout(1,2);

%% 1 grafikas

nexttile;

plot(t,U,'b-','LineWidth',1.5);
hold on;

plot(t,U_filtruotas,'g.','MarkerSize',5);

% U1
yline(U1,'k--','U_1','LineWidth',1.3);

% U2
yline(U2,'k-.','U_2','LineWidth',1.3);

grid on;

xlabel('Laikas, s','FontSize',13,'FontWeight','bold');
ylabel('Itampa, V','FontSize',13,'FontWeight','bold');

title('Pradinis ir filtruotas signalai');

legend('Pradinis signalas', ...
       'Filtruotas signalas', ...
       'U_1', ...
       'U_2');

hold off;

%% 2 grafikas

nexttile;

% >u1
ind = U > U1;

stem(t(ind), U(ind), 'k.', 'MarkerSize', 12);
hold on;

% min max
[Umax, imax] = max(U(ind));
[Umin, imin] = min(U(ind));

% max
plot(t(imax), Umax, 'kd', ...
    'MarkerSize', 10, ...
    'MarkerFaceColor', 'k');

% min
plot(t(imin), Umin, 'kd', ...
    'MarkerSize', 10);

grid on;
xlabel('Laikas, s');
ylabel('Itampa, V');
title('U > U_1 ir ekstremumai');

legend('U > U_1', ...
       'Maksimali reiksme', ...
       'Minimali reiksme');

hold off;

%% Rezultatu isvedimas

fprintf('Maksimali itampa = %.3f V\n',Umax);
fprintf('Maksimumo laikas = %.3f s\n',t(imax));

fprintf('Minimali itampa = %.3f V\n',Umin);
fprintf('Minimumo laikas = %.3f s\n',t(imin));

fprintf('U1 = %.3f V\n',U1);
fprintf('U2 = %.3f V\n',U2);