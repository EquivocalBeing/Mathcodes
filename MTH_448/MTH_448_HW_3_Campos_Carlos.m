clc
clear

%%  1

x = linspace(0,50,10);


% 1_1

% (a) 


% f(x,y) = x + y + 2
y1 = -(x + 2);

figure(1);
plot(x, y1);

xlabel('x');
ylabel('y');
title("x + y + 2");

% (b)

% f(x, y) = x^2 - 2xy + y^2
% f(x, y) = (x-y)^2

y2 = x;

figure(2);
plot(x, y2);

xlabel('x');
ylabel('y');
title("x^2 - 2xy + y^2")

% 1_2

x = linspace(0,50,10);
y = linspace(0,50,10);

[x, y] = meshgrid(x, y);

% (a)

z3 = x.^2 -4.*x.*y + y.^2;
%f3 = x.^2 -4.*x.*y + y.^2;

figure(3);
surf(x, y, z3);

xlabel('x');
ylabel('y');
zlabel('z');
title("x^2 - 4xy + y^2")

% (b)

z4 = x.^4 -4.*x.*y + y.^4;

figure(4);
hs = surf(x, y, z4);
hs.MeshStyle = 'column';

xlabel('x');
ylabel('y');
zlabel('z');
title("x^4 - 4xy + y^4")







