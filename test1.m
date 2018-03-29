% Toèke (2,1), (0, -1), (-1,1)

% Vektor, ki vsebuje x-koordinate danih treh toèk
x = [2 0 -1];
% Vektor, ki vsebuje y-koordinate danih treh toèk
y = [1 -1 1];


%plot(x,y,'*')
%axis equal
%axis([-2 3 -2 2])

% Vandermondova matrika za
V = @(x) [0 0 1; x^2 x 1; 1 1 1];

% Konfiguracijska matrika za dane tri toèke
R = [x' y' [1 1 1]'];

% Matrika, ki podaja parabolo y = x^2
D = [0 0 1; 0 -2 0; 1 0 0];

Aalfa = @(x) [0 x^2 1; x^2 0 (x-1)^2; 1 (x - 1)^2 0];

% Predpis : Balfa = inv(R)*Aalfa(x)*(inv(R))'
Balfa = @(x) R \ (Aalfa(x) / R');

