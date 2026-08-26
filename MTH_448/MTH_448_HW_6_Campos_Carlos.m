clc
clear

t = [1, 2, 3, 4, 5];
y = [1, 1, 2, 6, 24];
x = linspace(1, 5, 500);

% Part (a): 
V = vander(t); 
coeffs = V \ y';

p_mono = polyval(coeffs, x);

% Part (b): 
p_spline = spline(t, y, x);


g = gamma(x);

figure(1);
plot(x, p_mono, 'b-', 'LineWidth', 2); hold on;
plot(x, g, 'r--', 'LineWidth', 2);
plot(t, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor','k');
legend('Degree-4 Polynomial', 'Gamma function', 'Data points');
title('Part (a): Monomial Basis Polynomial Interpolant vs Gamma Function');
xlabel('x'); ylabel('y'); grid on;

figure(2);
plot(x, p_spline, 'b-', 'LineWidth', 2); hold on;
plot(x, g, 'r--', 'LineWidth', 2);
plot(t, y, 'ko', 'MarkerSize', 8, 'MarkerFaceColor','k');
legend('Cubic Spline', 'Gamma function', 'Data points');
title('Part (b): Cubic Spline Interpolant vs Gamma Function');
xlabel('x'); ylabel('y'); grid on;

% Parts (c)
err_poly   = abs(p_mono - g);
err_spline = abs(p_spline - g);

fprintf('=== Part (c): Max error over [1,5] ===\n');
fprintf('  Polynomial: %.6f\n', max(err_poly));
fprintf('  Spline:     %.6f\n', max(err_spline));


% Parts (d)
idx_12 = x <= 2;
fprintf('\n=== Part (d): Max error over [1,2] ===\n');
fprintf('  Polynomial: %.6f\n', max(err_poly(idx_12)));
fprintf('  Spline:     %.6f\n', max(err_spline(idx_12)));