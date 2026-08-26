clear all
close all
clc

disp('Lab #2')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem 1
disp('Problem 1');

x = [4, 2, 6, 5, 7, 2];

% 1a
tot = 0;
for j = 1:length(x)
    tot = tot + x(j);
end

disp('-----------------------');
disp('1a:');
disp('x vector summation:')
disp(tot);

% 1b

total = zeros(size(x));

total(1) = x(1);
for j = 2:length(x)
    total(j) = total(j - 1) + x(j);
end

disp('-----------------------');
disp('1b:');
disp('running sum for element j:')
disp(total);

% 1c

disp('-----------------------');
disp('1c:');

sine = zeros(size(x));
for j = 1:length(x)
    sine(j) = sin(x(j));
end

disp('sin(x) of given values:');
disp(sine);

%% Problem 2
disp('Problem 2');

x = [8, 3, 8];
y = [3, 7, 9];

% 2a
n = length(x);
for i = 1:n
    for j = 1:n
        a(i,j) = x(i) * y(j);
    end
end

disp('-----------------------');
disp('2a:');
disp(a)

% 2b

for i = 1:n
    for j = 1:n
        b(i,j) = x(i) / y(j);
    end
end

disp('-----------------------');
disp('2b:');
disp(b)

% 2c

tot = 0;
for i = 1:n
    for j = 1:n
        c(i) = x(i) * y(j);
    end
    tot = tot + c(i);
end

disp('-----------------------');
disp('2c:');
disp(tot)

% 2d

tot = 0;
for i = 1:n
    for j = 1:n
        d(i,j) = x(i) / (2 +x(i) + y(j));
    end
    tot = tot + d(i);
end

disp('-----------------------');
disp('2d:');
disp(tot)

% 2e

for i = 1:n
    for j = 1:n
        e(i,j) = 1 / min(x(i), y(j));
    end
end

disp('-----------------------');
disp('2e:');
disp(e)

%% Problem 3
disp('Problem 3');

% 3a

a = ones(6);

disp('-----------------------');
disp('3a:');
disp(a)

% 3b

b = zeros(8);
b(2:7, 2:7) = a;

disp('-----------------------');
disp('3b:');
disp(b)

% 3c

c = zeros(8);

c(2, 2) = a(1, 1);
c(2, 4:8) = a(1, 2:6);
c(4:8, 2) = a(2:6, 1);
c(4:8, 4:8) = a(2:6, 2:6);

disp('-----------------------');
disp('3c:');
disp(c)

%% Problem 4
disp('Problem 4');

x = 0: pi/50: 4 *pi;

y = sin(x);

figure
plot(x,y)
title('Graph of sine between 0 and 4\pi')
xlabel('0 \leq x \leq 4\pi')
ylabel('sine values')

%% Problem 5
disp('Problem 5');

x = -2*pi :4*pi/99: 2*pi;
y1 = sin(x);
y2 = cos(x);

figure
plot(x,y1, 'blue',x,y2, 'red')
title('Graph of sine and cosine between -2\pi and 2\pi')
xlabel('-2\pi \leq x \leq 2\pi')
ylabel('sine and cosine values')
legend('y = sin(x)', 'y = cos(x)')

%% Problem 6
disp('Problem 6');

x = [0, 0, 10, 10];
y = [0, 10, 10, 0];

figure
plot(x,y, 'black')
axis([-2, 12, -2, 12])
text(0,0, '(0,0)', 'HorizontalAlignment', 'right')
text(0,10, '(0,10)', 'HorizontalAlignment', 'right')
text(10,10, '(10,10)')
text(10,0, '(10,0)')
































