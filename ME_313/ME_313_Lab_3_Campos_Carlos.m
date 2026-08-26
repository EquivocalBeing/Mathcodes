clear all
close all
clc

disp('Lab #3')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem 1
disp('Problem 1');

%a = input("enter a 3x3 matrix: ");
a = [3,3,3;
     3,3,3;
     3,3,3];
flag = 1;

for i = 1:size(a)
    for j = 1:size(a)
        if i ~= j && a(i,j) ~= a(i,j)
            flag = 0;
        end
    end
end

if flag == 1
    disp('-----------------------');
    disp(flag);disp("The flag is symmetrical");
else
    disp('-----------------------');
    disp(flag);disp("The flag is not symmetrical");
end

%% Problem 2
disp('Problem 2');

a = [[1, 2, 15],
     [3, 2, 4],
     [0, 5, -7]];

b = [15; 25; 35];

a_i = inv(a);

x = a_i * b;

disp('-----------------------');
disp('x matrix:')
disp(x);

%% Problem 3
disp('Problem 3');

a = randi([1 30], 1, 10);
disp('a:');
disp(a);

max_a = a(1,1);
min_a = a(1,1);

for i = 1:10
    if a(i) > max(a)
        max_a = a(i);
    end
end

disp('a max:')
disp(max_a);

for i = 1:10
    while min_a > a(i)
        min_a = a(i);
    end
end

disp('a min:')
disp(min_a)

b = sort(a, 'ascend');
c = sort(a, 'descend');

disp('b:');
disp(b);
disp('c:');
disp(c);

%% Problem 4
disp('Problem 4');

L = 10; % [m]
q = 10; % [kN/m]
E = 30*10^6; % Pa
b = 0.2; % [m]
h = 0.4; % [m]
N = 50;

I = b*h^3/12;
A = b*h;

x = 0:1/N:L;
y = zeros(1, length(x));

delta = q / (24*E*I) * (-x.^4 + 2* L* x.^3 - L^3* x)* 1000; % [mm]

M = 1/24 * q * (12 *L *x - 12* x.^2);
V = 1/24 * q * (12 *L - 24* x);

sigma = (M * max(y)) / I;
tao = 3/2 * (V/A);

plot(x,y, 'black', x, delta, 'red', 'LineWidth', 3)
title('Position Vs Deflection')
xlabel('Position')
ylabel('Deflection')
figure

plot(x,y, 'black', x, M, 'blue', 'LineWidth', 3)
title('Position Vs Moment')
xlabel('Position')
ylabel('Moment')
figure

plot(x,y, 'black', x, V, 'green', 'LineWidth', 3)
title('Position Vs Shear Forces')
xlabel('Position')
ylabel('Shear Forces')
figure

plot(x,y, 'black', x, sigma, 'm', 'LineWidth', 3)
title('Position Vs Stress')
xlabel('Position')
ylabel('Stress')
figure

plot(x,y, 'black', x, tao, 'c', 'LineWidth', 3)
title('Position Vs Sheat Stress')
xlabel('Position')
ylabel('Sheat Stress')















