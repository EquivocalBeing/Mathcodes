clear
clc

f_hw = cell(1, 4);
df_hw = cell(1, 4);

% a
f_hw{1} =  @(x) (x^3 - 2*x - 5);
df_hw{1} =  @(x) (3*x^2 - 2);

% b
f_hw{2} =  @(x) (exp(-x) - x);
df_hw{2} =  @(x) (-exp(-x) - 1);

% c
f_hw{3} =  @(x) (x*sin(x) - 1);
df_hw{3} =  @(x) (sin(x) + x*cos(x));

% d
f_hw{4} =  @(x) (x^3 - 3*x^2 + 3*x - 1);
df_hw{4} =  @(x) (3*x^2 - 6*x + 3);

let = ["a", "b", "c", "d"];
n = 10000;
tol = 0.001;
a = -3;
b = 4;
x0 = 1; 
x1 = 2;

for i = 1:4
    fprintf("roots for: " + let(i) + "\n\n")
    
    fprintf("\nbisec")
    bisection(f_hw{i}, a, b, tol)
    fprintf("\nnewton")
    newton(f_hw{i}, df_hw{i}, x0, tol, n)
    fprintf("\nsecant")
    secant(f_hw{i}, x0, x1, tol, n)

    fprintf("-----------------------------\n\n")
end












