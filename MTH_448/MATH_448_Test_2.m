%% 1
clc
clear

% b
H = [1,   1/2, 1/3;
     1/2, 1/3, 1/4;
     1/3, 1/4, 1/5]

kappa_h = cond(H)

% c

b = [11/6; 
     13/12; 
     47/60];

x = [1; 
     1; 
     1];

b_hat = [10^-2; 
         0; 
         0];

[q,r] = qr(H);
x_hat = H' * b_hat

x_delta = x_hat - x

xs = norm(x_delta) / norm(x)

bs = norm(b_hat - b) / norm(b);

cond(H) * bs

%% 2
clc
clear

a2 = [0, 1, 3;
      2, 3, 1;
      6, 9, 8];

p2 = [0, 1, 0;
      1, 0, 0;
      0, 0, 1];

a2_p = p2 * a2

m1 = [1, 0, 0;
     0, 1, 0;
     -3, 0, 1];

U=m1*a2_p

L = m1^-1



cond(p2);

[l,u] = lu(a2);

%% 3
clc 
clear

a3 = [3,  5;
      4, 12;
      0, 13];


% a

a3_1 = a3(1:3,1:1);

a3_2 = a3(1:3, 2:2);

num = dot(a3_2, a3_1);

dom = dot(a3_1, a3_1);

proj_a1a2 = (num / dom) * a3_1

u2 = a3_2 - proj_a1a2

dot(u2,a3_1)

u2_hat = 1/norm(u2) * u2

% b

w = a3_1 + norm(a3_1) * [1;0;0]

H = eye(3) - (2 / norm(w)^2) * (w * transpose(w))






