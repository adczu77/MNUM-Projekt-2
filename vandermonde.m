% Definicja procedury, jej parametrów wejściowych i wejściowych:
function [yw] = vandermonde(a, x, y)
% Uzyskanie macierzy Vandermonde'a:
[V] = ex2_gen_data(x);
% Rozwiązanie układu równań Vx=y:
xw = linsolve(V,y);
[~,k] = size(V);
yw = 0;
% Wyznaczenie wartości wielomaniu interpolacyjnego dla zadanego argumentu:
for i=1:k
    yw = yw + xw(i,:)*(a^(i-1));
end
