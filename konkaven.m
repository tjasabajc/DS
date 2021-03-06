X = [0 -1 3];
Y = [2 -1 -1];

R = [X' Y' [1 1 1]'];

iV = @(x) [1/x 1/(x^2-x) 1/(1-x); -(x+1)/x 1/(x-x^2) x/(x-1); 1 0 0];

Tx = 1;
Ty = 0;

d = 2; % za risanje
clf

hold on

plot(X, Y, 'ro')
plot(Tx, Ty, 'ro')
axis equal
grid off
line([0 0], [min(R(:,2))-d, max(R(:,2))+d]);
line([min(X)-d, max(R(:,1))+d], [0 0]);
axis([min(X)-d, max(R(:,1))+d, min(R(:,2))-d, max(R(:,2))+d])

line(X,Y);
line([Tx X(end)], [Ty Y(end)]);
line([X(1) Tx], [Y(1) Ty]);

hold off