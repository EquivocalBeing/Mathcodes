clc
clear

%% 1

a1 = [1, 0;
      1, 1;
      1, 3;];

b1 = [1;
      2;
      3;];


% part b

at = transpose(a1);

at_a1 = at * a1

at_b1 = at * b1

% part c


[q,r] = qr(a1,"econ")

%sym(transpose(q) * a1)

x = sym(r^-1 * transpose(q) * b1)

%% Problem 2

a2 = [1, 0;
     1, 1;
     1, 2;
     1, 3;];

r2_1 = [1; 1; 1; 1];

dot(a2(1:4, 1:1), r2_1)


















