% =========================================================
% Computer Problem 2 - Forward Euler for y' = -200*t*y^2
% y(0) = 1, solved on [0, 1]
% Exact solution: y(t) = 1 / (1 + 100*t^2)
% =========================================================

function forward_euler_stiff()
    y0 = 1;
    t_end = 1;
    exact = @(t) 1 ./ (1 + 100*t.^2);
    f = @(t, y) -200 * t * y^2;

    fprintf('=== Forward Euler: y'' = -200*t*y^2 ===\n\n');

    % --- Run for both step sizes ---
    for h = [0.01, 0.001]
        fprintf('--- h = %.3f ---\n', h);
        [t, y] = forward_euler(f, y0, t_end, h);

        % Error at final time
        y_exact_end = exact(t_end);
        err = abs(y(end) - y_exact_end);
        fprintf('y(1) approx  = %.6f\n', y(end));
        fprintf('y(1) exact   = %.6f\n', y_exact_end);
        fprintf('Abs error    = %.2e\n\n', err);

        % Plot
        figure;
        t_fine = linspace(0, t_end, 1000);
        plot(t_fine, exact(t_fine), 'k-', 'LineWidth', 2, 'DisplayName', 'Exact');
        hold on;
        plot(t, y, 'r--', 'LineWidth', 1.5, 'DisplayName', sprintf('Forward Euler h=%.3f', h));
        xlabel('t'); ylabel('y(t)');
        title(sprintf("Forward Euler for y' = -200ty^2, h = %.3f", h));
        legend; grid on;
    end
end

% --- Forward Euler Routine ---
function [t, y] = forward_euler(f, y0, t_end, h)
    t = 0 : h : t_end;
    y = zeros(size(t));
    y(1) = y0;
    for i = 1 : length(t) - 1
        y(i+1) = y(i) + h * f(t(i), y(i));
    end
end