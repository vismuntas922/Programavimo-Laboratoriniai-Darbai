%% LD2_VismuntasSkarbalius EEF-25/2 09-16

clear;
clc;
close all;

%% vienmaciai masyvai

a = (200:-10:10)';
b = log10(a);
c = 10.^b;
d = c - a;

disp(' 1 UZDUOTIS ');
disp('a = ');
disp(a);

disp('b = log10(a) = ');
disp(b);

disp('c = 10.^b = ');
disp(c);

disp('d = c - a = ');
disp(d);


%% dvimaciai masyvai

A = [pi/2, 3i, exp(2);
     log2(2), 2*pi, log10(1);
     log(exp(1)), pi^pi, cos(pi)];

disp(' 2 UZDUOTIS ');
disp('Pradine matrica A:');
disp(A);

A(:,2) = rand(3,1);

disp('Matrica po antro stulpelio pakeitimo:');
disp(A);

stulpeliu_sumos = sum(A);

disp('Stulpeliu sumos:');
disp(stulpeliu_sumos);


%% signalai

A = 6;
f = 2;
sigma = 1.5;
U1 = 4;
U2 = 2;

t = 0:0.005:2;

n = sigma * randn(size(t));

s0 = A*cos(2*pi*f*t);

s = s0 + n;


% a) reiksmes virs u1
atrinktos = s(s > U1);


% b) filtravimas
sf = s;
sf(abs(sf) < U2) = 0;


% c) nefiltruoto signalo dydis
nefiltruoto_dydis = size(s);


% d) atrinktu reiksmiu dydis
atrinktu_dydis = size(atrinktos);


% e) min ir max
didziausia = max(sf);
maziausia = min(sf);


disp(' 3 UZDUOTIS ');

disp('a) reiksmes virs u1:');
disp(atrinktos);

disp('b) filtravimas:');
disp(sf);

disp('c) nefiltruoto signalo dydis:');
disp(nefiltruoto_dydis);

disp('d) atrinktu reiksmiu dydis:');
disp(atrinktu_dydis);

disp('e) max:');
disp(didziausia);

disp('e) min:');
disp(maziausia);


% grafikas
figure;
plot(t,s);
grid on;
xlabel('t, s');
ylabel('U, V');
title('triuksmo paveiktas signalas');

%% papildoma uzd

%% masyvo elementu indeksavimas 

A = [0 1 0 2 3 0 4;
    0 0 0 0 0 0 0;
    0 5 0 6 7 0 8;
    0 9 0 1 2 0 3;
    0 0 0 0 0 0 0;
    0 4 0 5 6 0 7];

% eilutes kur ne tik nuliai
eilutes = any(A ~= 0, 2);

% stulpeliai kur ne tik nuliai
stulpeliai = any(A ~= 0, 1);

% matrica be nuliniu eiluciu ir stulpeliu
B = A(eilutes, stulpeliai);

disp('Pradine matrica A:');
disp(A);

disp('Matrica B be nuliniu eiluciu ir stulpeliu:');
disp(B);