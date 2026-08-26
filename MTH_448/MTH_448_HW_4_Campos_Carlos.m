clc
clear

%% 1

a1 = [1 1 0;
      1 2 1;
      1 3 2];

det(a1)

b1 = [2; 4; 6];


%% 2

epsilon = 10^-9;

a2 = [     1,     1 + epsilon;
      1 - epsilon,     1     ];

det(a2)

e2 = [     1,     0;
      -1 + epsilon,     1     ];

U2 = e2 * a2

L2 = inv(e2)

%% 3


a3 = [0, 1;
      1, 0];

e3 = [0, 1;
      -1, 0];

U3 = e3 * a3

%% Programming

exact = [1;1];

for k = 1:10

    eps = 10^(-2*k);

    A = [eps 1;
         1   1];

    b = [1+eps;
         2];

    x1 = gauss(A,b);
    x2 = gauss_partial(A,b);

    err1 = norm(x1 - exact);
    err2 = norm(x2 - exact);

    fprintf("k = %d\n",k)
    fprintf("No Pivot Error = %e\n",err1)
    fprintf("Partial Pivot Error = %e\n\n",err2)

end















