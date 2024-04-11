%Definicja funkcji generującej macierz na podstawie wektora x:
function [A] = ex1_gen_data(x, n)
% x - wektor argumentów funkcji
% n - stopień wielomianu aproksymującego
[l, ~] = size(x);
A = zeros(l, n+1);
% Generowanie macierzy A:
for i=1:n+1
    if i == n+1
        A(:,i) = x.^0;
    else
        A(:,i) = x.^(n+1-i);
    end
end