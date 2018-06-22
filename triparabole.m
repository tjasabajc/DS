function [ output_args ] = triparabole( R )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

iV = @(x)[1/x,1/(x^2-x),1/(1-x);-(x+1)/x,1/(x-x^2),x/(x-1);1,0,0];
%A = [0.2, 0.5, 0.75];

clf
plot(R(:,1), R(:,2), 'ro')
hold on

t = linspace(0,1,500);

inverz = iV(0.2);
parametrizacija = inverz*R;
p = parametrizacija(:,1);
q = parametrizacija(:,2);
plot(polyval(p,t), polyval(q,t), 'k')

hold on

inverz = iV(0.3);
parametrizacija = inverz*R;
p = parametrizacija(:,1);
q = parametrizacija(:,2);
plot(polyval(p,t), polyval(q,t), 'g')

hold on

inverz = iV(0.6);
parametrizacija = inverz*R;
p = parametrizacija(:,1);
q = parametrizacija(:,2);
plot(polyval(p,t), polyval(q,t), 'b')

hold on

inverz = iV(0.7);
parametrizacija = inverz*R;
p = parametrizacija(:,1);
q = parametrizacija(:,2);
plot(polyval(p,t), polyval(q,t), 'm')

d=3;

axis([min(R(:,1))-d, max(R(:,1))+d-1, min(R(:,2))-d, max(R(:,2))+d-1])

end

