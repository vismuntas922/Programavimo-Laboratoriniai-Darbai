% LD4 Vismuntas Skarbalius EEf-25-2 09-30

clc;
clear;
close all;

clc;
clear;
close all;

%% 1a
x = (2*rand(1,200)-1) * sqrt(pi/2);
y = (2*rand(1,200)-1) * sqrt(pi/2);

[X,Y] = meshgrid(x,y);

Z = sin(X.^2 + Y.^2);

figure('Name','1(a)');

surf(X,Y,Z);

% spalva
colormap parula;

% atvaizdavimas be tinklelio
shading interp;

xlabel('x');
ylabel('y');
zlabel('f(x,y)');

title('f(x,y) = sin(x^2 + y^2)');

grid on;
axis tight;

% asvietimas
camlight left;
lighting gouraud;

hold on;

% apskritimo ketvirtis
t = linspace(0,pi/2,200);

xc = cos(t);
yc = sin(t);

zc = sin(xc.^2 + yc.^2);

plot3(xc,yc,zc,'r','LineWidth',3);
view(15,15);

hold off;

view(15,15)


%% 1b

x = linspace(-1,1,150);
y = linspace(-1,1,150);

[X,Y] = meshgrid(x,y);

% r
R = sqrt(X.^2 + Y.^2);

% z(r) = e^(r^2)
Z = exp(R.^2);

figure('Name','1(b)');

surf(X,Y,Z);

% spalva
colormap turbo;

% svelniam pavirsiui
shading interp;

xlabel('x');
ylabel('y');
zlabel('z');

title('z(r) = e^{r^2},  r = sqrt(x^2+y^2)');

grid on;
axis tight;

% seseliai apsvietimas
camlight left;
lighting gouraud;

% pasuktas vaizdas
view(20,20);


%% pap uzd

x = linspace(-2,2,150);
y = linspace(-2,2,150);

[X,Y] = meshgrid(x,y);

Z = 1 - (X.^2 + Y.^2);

figure('Name','Papildoma uzduotis');

surf(X,Y,Z, ...
    'FaceColor','red', ...
    'EdgeColor','none');

xlabel('x');
ylabel('y');
zlabel('z');

title('z(x,y) = 1 - (x^2 + y^2)');

grid on;
axis tight;

camlight left;
lighting gouraud;

view(3);


%% pabaiga

disp('Visos uzduotys nubraizytos.');