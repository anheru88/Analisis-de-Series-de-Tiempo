function [A,B]=calculate_fft(y)
%
% function [A,B]=calculate_fft(y);
%
% Function that estimates the Amplitudes
% of the cosand sin functions for a time-series
% Estimate the amplitudes A and B
%

y=y(:);
N=length(y);
%
for p=1:1:floor(N/2);
Alpha=0;
Beta =0;
for n=1:1:N
Alpha=Alpha+ (2/N)*(y(n)*cos((2*pi*n*p)/N));
Beta =Beta + (2/N)*(y(n)*sin((2*pi*n*p)/N));
end
A(p)=Alpha;
B(p)=Beta;
end
Ao=2*mean(y);
A=[Ao A];
B=[0 B];




%pag 389
%amplitudes and phases
%y=[7.6 7.4 8.2 9.2 10.2 11.5 12.4 13.4 13.7 11.8 10.1  9  8.9  9.5  10.6 %11.4  12.9  12.7 13.9 14.2 13.5 11.4 10.9 8.21]