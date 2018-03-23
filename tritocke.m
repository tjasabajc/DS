
% Vektor, ki vsebuje x-koordinate danih treh toèk
X = [5 -3 2];
% Vektor, ki vsebuje y-koordinate danih treh toèk
Y = [3 -6 5];


%plot(x,y,'*')
%axis equal
%axis([-2 3 -2 2])

% Vandermondova matrika za x in njen inverz
V = @(x) [0 0 1; x^2 x 1; 1 1 1];
iV = @(x) [1/x 1/(x^2-x) 1/(1-x); -(x+1)/x 1/(x-x^2) x/(x-1); 1 0 0];

% Konfiguracijska matrika za dane tri toèke
R = [x' y' [1 1 1]'];

% Matrika, ki podaja parabolo y = x^2
D = [0 0 1; 0 -2 0; 1 0 0];

Aalfa = @(x) [0 x^2 1; x^2 0 (x-1)^2; 1 (x - 1)^2 0];

% Predpis : Balfa = inv(R)*Aalfa(x)*(inv(R))'
Balfa = @(x) R \ (Aalfa(x) / R');

% parametrizacija = @(x) iV(x)*R;
% %p = @(x) parametrizacija(x)(:,1);
% %q = @(x) parametrizacija(x)(:,2);
% 
% param = parametrizacija(0.5);
% 
% hold on
% plot(X,Y,'ro')
% t=linspace(0,1);
% P = polyval(param(:,1),t);
% Q = polyval(param(:,2),t);
% plot(P,Q,'b')
% axis equal
% axis([min(X)-1, max(X)+1, min(Y)-1, max(Y)+1])
% hold off

A = 0.1 * linspace(1,9,30);
B = 0.1 * linspace(-9,-1,30);
C = 0.1 * linspace(11,19,30);
A1 = [B A C];
narisi(R, iV, A1)
