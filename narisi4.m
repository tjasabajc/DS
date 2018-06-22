function [ ] = narisi4( R, iV, A, T, tip )
% Nariše parabole skozi toèke iz R za vrednosti alfa iz A
%   V matriki R so koordinate treh toèk v ravnini.
%   iV je funkcija, ki vrne inverz Vandermondove matrike za alfa

d = 3; % za risanje
clf

for i = 1:length(A)
    %clf
    hold on
    X = R(:,1);
    Y = R(:,2);
    plot(X, Y, 'ro')
    plot(T(1), T(2), 'ro')
    axis equal
    grid on
    %line([0 0], [min(R(:,2))-d, max(R(:,2))+d]);
    %line([min(X)-d, max(R(:,1))+d], [0 0]);
    axis([min(X)-d, max(R(:,1))+d-1, min(R(:,2))-d, max(R(:,2))+d])
    t = linspace(0,1);
    al = A(i);
    inverz = iV(al);
    parametrizacija = inverz*R;
    p = parametrizacija(:,1);
    q = parametrizacija(:,2);
    t1 = linspace(1,3);
    t2 = linspace(-2,0);
    plot(polyval(p,t), polyval(q,t), 'r')%, 'LineWidth', 2)
    switch tip
        case 't' 
            %title('TRAPEZ - natanko ena interpolacijska krivulja')
            line([X(1) X(2) T(1) X(3) X(1)], [Y(1) Y(2) T(2) Y(3) Y(1)])
        case 'k'
            %title('KONVEKSEN LIK - dve interpolacijski krivulji')
            line(X,Y);
            line([T(1) X(end)], [T(2) Y(end)]);
            line([X(1) T(1)], [Y(1) T(2)]);
    end
    plot(polyval(p,t1), polyval(q,t1), 'r:', 'LineWidth', 2) %, 'r', 'LineWidth', 2) % ':'
    plot(polyval(p,t2), polyval(q,t2), 'r:', 'LineWidth', 2) %, 'r', 'LineWidth', 2) % ':'
    
    
    
    pause(0.1)
    hold off
end

