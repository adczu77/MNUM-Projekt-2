clc;
clear;
% Wektor stopni wielomianu:
n = [3;5;7;9;10];
% Wektora argumentów funkcji:
x = [-10;-8;-6;-4;-2;0;2;4;6;8;10];
% Wektor wartości funkcji:
y = [-5.4606;-3.8804;-1.9699;-1.6666;-0.0764;-0.3971;-1.0303;-4.5483;-11.5280;-21.6417;-34.4458];
% Wektor wartości przedstawianych na osi OX wykresu, aby uzyskać
% dokładniejszy wykres funkcji aproksymującej:
xac = (-10:0.2:10)';
% Wektor błędów liczonych jako norma euklidesowa różnicy wektora wartości funkcji
% pierwotnej i wektora wartości funkcji aproksymującej:
EPSe = zeros(length(n), 1);
% Wektor błędów liczonych jako norma maksimum różnicy wektora wartości funkcji
% pierwotnej i wektora wartości funkcji aproksymującej:
EPSm = zeros(length(n), 1);
l = length(n);
% Zliczenie wyników i utowrzenie wykresów:
for j=1:length(n)
% Zerowanie wektora yw - wektora wartości funkcji aproksymującej:
    yw = zeros(length(x), 1);
% Wyliczenie wartości funkcji aproksymującej dla każdego elementu podanego
% wektora argumentów (x), następnie zebranych do wektora yw:
    for i=1:length(x)
        yw(i,1) = qr_approximate(x(i,:), n(j,1), x, y);
    end
% Wyliczenie błędu aproksymacji między wektorami wartości funkcji
% pierwotnej i wartościami funckji aproksymującej w normach: euklidesowej i
% maksimum:
    EPSe(j,1) = norm(y-yw);
    EPSm(j,1) = max(abs(y-yw));
% Utworzenie wykresu funkcji aproksymującej dane wykorzystując zbiór danych
% x1, aby uzyskać większą dokładność rysowanej funkcji:
    for i=1:length(xac)
        yw(i,1) = qr_approximate(xac(i,:), n(j,1), x, y);
    end
    figure;
    plot(xac,yw);
    title("Wykres funckji aproksymującej wielomianem stopnia: "+n(j,1)+"" + ...
        " // wielomian interpolacyjny stopnia 11:");
    ylabel("Wartości funckji aproksymującej");
    xlabel("Argumenty");
    ylim([-40,5]);
% Dodanie wykresu wielomianu interpolacyjnego:
    hold on;
    for k=1:length(xac)
        yw(k,1) = vandermonde(xac(k,1), x, y);
    end
    plot(xac, yw);
    legend("Wielomian aproksymujący podanego stopnia", "Wielomian interpolacyjny");
    hold off;
end
% Utworzenie wykresów błędów aproksmacji dla dwóch norm:
figure;
scatter(n,EPSe, 'filled', 'red');
title("Wykres błędu aproksymacji w normie euklidesowej");
ylabel("Wartość błędu");
xlabel("Stopień wielomianu aproksymującego");
figure;
scatter(n, EPSm, 'filled', 'blue');
title("Wykres błędu aproksymacji w normie maksimum");
ylabel("Wartość błędu");
xlabel("Stopień wielomianu aproksymującego");
% Utworzenie osobnego wykresu wielomianu interpolacyjnego:
yw = zeros(length(xac), 1);
for j=1:length(xac)
    yw(j,1) = vandermonde(xac(j,1), x, y);
end
figure;
plot(xac, yw);
title("Wykres wielomianu interpolacyjnego za pomocą macierzy Vandermonde'a:");
xlabel("Stopień wielomianu interpolacyjnego")
ylabel("Wartość wielomianu interpolacyjnego dla danego punktu")
ylim([-40,5]);
% Obliczenie błędu interpolacji:
yw = zeros(length(x), 1);
for j=1:length(x)
    yw(j,1) = vandermonde(x(j,1), x, y);
end
EPSve = norm(y-yw);
EPSvm = max(abs(y-yw));