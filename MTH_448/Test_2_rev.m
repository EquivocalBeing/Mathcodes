clc
clear

a = [1.0, 1/2;
     1/2, 1/3;
     1/3, 1/4;];

b = [3/2; 5/6; 7/12];


e = [exp(-2); 0; 0];

be = b+e;

%% Part a

% a^T(a)(x) = a^t(b)

aT = transpose(a);
aTa = aT * a

kapa = cond(aTa)

%% Part B
aT_hat = round(aT,3)
at_hat = round(aT_hat*be,3)

x = aTa\at_hat



ef = x - [1:1]

norm(ef)/norm(1:1)

%% Part C

[q, r] = qr(a, "econ")

x_b = r\(transpose(q)*be)