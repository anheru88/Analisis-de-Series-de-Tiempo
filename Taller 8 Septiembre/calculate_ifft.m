function [y,Y,f]=calculate_ifft(A,B,to,tf,dt,f)

% function [y,Y]=calculate_ifft(A,B,N);
%
% Function that uses the fouriercoefficients
% to estimate the original time series.
% N is the number of points to estimate
% Estimate the amplitudes A and B
%
t=to:dt:tf;


A=A(:);
B=B(:);
Ao=A(1);
f=f(2:end);
A=A(2:end);
B=B(2:end);
Na=length(A);
Nb=length(B);
if Na~=Nb
error('A and B must be the same size')
end
N=length(t);
y=zeros(Na,N);
%
I=[1:1:N];
for J=1:Na;
y(J,:)=y(J,:)+A(J)*cos(2*pi*f(J)*t(I))+B(J)*sin(2*pi*f(J)*t(I));
end
Y=sum(y,1)+0.5*Ao;