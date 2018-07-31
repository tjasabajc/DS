function [ rezultati ] = sinus( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
k = @(t) [t, cos(t)];
H0 = 0;
H = pi/3;

rezultati = zeros(10,3);

for i=1:10
    h = H*(11-i)/10;
    T = h.*[H0, H0 + (H-H0)/3, H0 + 2*(H-H0)/3, H];
    tocke = zeros(2,4);
    for j=1:4
        tocke(:,j) = k(T(j))';
    end
    R = [tocke(:,[1 2 3])' [1 1 1]'];

    Tx = tocke(1,4);
    Ty = tocke(2,4);

    b = [Tx Ty 1] / R;

    alfa = (b(2)*b(3) + sqrt(-b(1)*b(2)*b(3)))/(b(2)*(b(1) + b(3)));
    
    iV = @(x) [1/x 1/(x^2-x) 1/(1-x); -(x+1)/x 1/(x-x^2) x/(x-1); 1 0 0];
    parametrizacija = iV(alfa)*R;
    p = parametrizacija(:,1);
    q = parametrizacija(:,2);
    
    beta = fzero(@(x) polyval(p,x) - Tx, 1);
    
    RR = [0 alfa^3 1 beta^3;
    0 alfa^2 1 beta^2;
    0 alfa 1 beta;
    1 1 1 1];
    fi = T/RR;

    F = @(x) -norm([polyval(p,x) polyval(q,x)] - k(polyval(fi,x)));
    t_max = min([fminbnd(F,0,alfa), fminbnd(F,alfa,1), fminbnd(F,1,beta)]);
    
    razlika = F(t_max);
    rezultati(i,[1 2]) = [(T(4) - T(1)), razlika];
    if i>1
        razmerje_razdalj = rezultati(i-1,2)/rezultati(i,2);
        razmerje_h = rezultati(i-1,1)/rezultati(i,1);
        rezultati(i,3) = log(razmerje_razdalj)/log(razmerje_h);
    end
end

