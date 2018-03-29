function [] = narisi( R, iV, A )
% Nariše parabole skozi toèke iz R za vrednosti alfa iz A
%   V matriki R so koordinate treh toèk v ravnini.
%   iV je funkcija, ki vrne inverz Vandermondove matrike za alfa

clf
% hold on
% plot(R(:,1), R(:,2), 'ro')
% axis equal
% axis([min(R(:,1))-1, max(R(:,1))+1, min(R(:,2))-1, max(R(:,2))+1])
% t = linspace(-3,3);
% hold on
for i = 1:length(A)
    clf
    hold on
    plot(R(:,1), R(:,2), 'ro')
    axis equal
    axis([min(R(:,1))-1, max(R(:,1))+1, min(R(:,2))-1, max(R(:,2))+1])
    t = linspace(0,1);
    al = A(i);
    inverz = iV(al);
    parametrizacija = inverz*R;
    p = parametrizacija(:,1);
    q = parametrizacija(:,2);
    t1 = linspace(1,3);
    t2 = linspace(-2,0);
    plot(polyval(p,t), polyval(q,t))
    plot(polyval(p,t1), polyval(q,t1)) % ':'
    plot(polyval(p,t2), polyval(q,t2)) % ':'
    pause(0.1)
    hold off
end

