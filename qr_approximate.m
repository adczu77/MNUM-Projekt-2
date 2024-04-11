% Definicja procedury, jej parametrów wejściowych i wejściowych:
function [yw] = qr_approximate(xp, n, x, y)
% xp - argument, dla którego funkcja ma zwracać wartość
% n - stopień wielomianu aproksymującego
% x - wektor argumentów funckji
% y - wektor wartości funckji
% Uzyskanie macierzy A:
A = ex1_gen_data(x,n);
% Rozkład macierzy A na macierz Q i R:
[Q, R] = qr(A);
% Uzyskanie wektora współczynników wielomianu aproksymującego rozwiązując
% równanie QR*x=y:
a = linsolve(Q * R, y);
yw = 0;
% Obliczenie wartości wielomianu aproksymującego dla zadanego punktu xp:
for i=1:n+1
    yw = yw + a(i,:)*(xp^(n+1-i));
end
