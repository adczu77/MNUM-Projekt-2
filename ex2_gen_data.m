% Definicja funckji generującej macierzy Vandermonde'a na podstawie wektora
% argumentów funkcji aproksymowanej:
function [V] = ex2_gen_data(x)
[l, ~] = size(x);
V = zeros(l, l);
% Generowanie macierzy Vandermonde'a:
for i=0:l-1
    if i == 0
        V(:,i+1) = x.^0;
    else
        V(:,i+1) = x.^(i);
    end
end