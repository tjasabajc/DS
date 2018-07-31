k = @(t) [cos(t), sin(t)];
t = linspace(0, 0.9*pi/2);
plot(cos(t), sin(t));
axis equal

T = 0.9.*[0, pi/6, pi/3, pi/2];
tocke = zeros(2,4);
for i=1:4
    tocke(:,i) = k(T(i))';
end
hold on
plot(tocke(1,:), tocke(2,:), 'ro');

% Interpolacija
%X = [0 -1 3];
%Y = [2 -1 -1];

R = [tocke(:,[1 2 3])' [1 1 1]'];

Tx = tocke(1,4);
Ty = tocke(2,4);

p = [Tx Ty 1] / R;

a1 = (p(2)*p(3) + sqrt(-p(1)*p(2)*p(3)))/(p(2)*(p(1) + p(3)));
a2 = (p(2)*p(3) - sqrt(-p(1)*p(2)*p(3)))/(p(2)*(p(1) + p(3)));

iV = @(x) [1/x 1/(x^2-x) 1/(1-x); -(x+1)/x 1/(x-x^2) x/(x-1); 1 0 0];
parametrizacija = iV(a1)*R;
p = parametrizacija(:,1);
q = parametrizacija(:,2);

x = linspace(-0.2,1.2);
hold on
plot(polyval(p,x), polyval(q,x));

hold on
plot(polyval(p,0), polyval(q,0), 'k*')
plot(polyval(p,a1), polyval(q,a1), 'g*')
plot(polyval(p,1), polyval(q,1), 'b*')


a3 = fzero(@(x) polyval(p,x) - Tx, 1);
hold on
plot(polyval(p,a3), polyval(q,a3), 'ys')

RR = [0 a1^3 1 a3^3;
    0 a1^2 1 a3^2;
    0 a1 1 a3;
    1 1 1 1];
fi = T/RR;

F = @(x) -norm([polyval(p,x) polyval(q,x)] - k(polyval(fi,x)));
neki = min([fminbnd(F,0,a1), fminbnd(F,a1,1), fminbnd(F,1,a3)]);
plot(polyval(p,neki), polyval(q,neki), 'k+')
test = zeros(1, length(x));
for i=1:length(x)
    test(i) = F(x(i));
end
figure; plot(x, test); hold on;
plot(neki, F(neki), 'r+')
razlika = F(neki);