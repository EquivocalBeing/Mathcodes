f     = @(t, y) -200 * t * y^2;
exact = @(t) 1 ./ (1 + 100*t.^2);

[y1, t1] = fEuler(f, 0, 1, 100, 1);
[y2, t2] = fEuler(f, 0, 1, 1000, 1);

t = linspace(0, 1, 5000);

figure;
plot(t, exact(t), 'k-',  'LineWidth', 2,   'DisplayName', 'Exact');
hold on;

plot(t1, y1, 'r--', 'LineWidth', 1.5,  'DisplayName', 'h = 0.01');
plot(t2, y2, 'g--', 'LineWidth', 1.5,  'DisplayName', 'h = 0.001');

xlabel('t');  
ylabel('y(t)');
title("Forward Euler: y' = -200ty^2");
legend;  grid on;