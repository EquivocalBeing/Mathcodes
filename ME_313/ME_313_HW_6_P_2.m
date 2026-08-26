% ============================================================
%  Quadratic Shape Functions by Polynomial-Fit (Vandermonde)
%  Nodes at xi = [0, 0.5, 1]
%  Author: ChatGPT
% ============================================================

clear; clc; close all;

% --- Define nodal locations on the reference element
xi_nodes = [0; 0.5; 1];

% --- Build Vandermonde matrix [1 xi xi^2] evaluated at node points
V = [ones(3,1), xi_nodes, xi_nodes.^2];

% --- Solve for polynomial coefficients of each shape function
%     Each column of I (3x3 identity) is the RHS for one shape function
coeffs = V \ eye(3);

% --- Display coefficients neatly
fprintf('Quadratic shape function coefficients (a0 + a1*xi + a2*xi^2):\n');
for i = 1:3
    fprintf('N%d(xi) = %+g + (%+g)*xi + (%+g)*xi^2\n', i, coeffs(1,i), coeffs(2,i), coeffs(3,i));
end

% --- Generate smooth xi vector for plotting
xi = linspace(0,1,400);
N = zeros(3,length(xi));

% --- Evaluate shape functions using the solved coefficients
for i = 1:3
    a0 = coeffs(1,i); a1 = coeffs(2,i); a2 = coeffs(3,i);
    N(i,:) = a0 + a1*xi + a2*xi.^2;
end

% --- Plot the shape functions
figure;
plot(xi, N(1,:), 'LineWidth', 2); hold on;
plot(xi, N(2,:), 'LineWidth', 2);
plot(xi, N(3,:), 'LineWidth', 2);
grid on; box on;
xlabel('xi = x/L', 'FontWeight','bold');
ylabel('N_i(xi)', 'FontWeight','bold');
title('Quadratic Shape Functions (Polynomial-Fit Method)');
legend('N_1','N_2','N_3','Location','best');
ylim([-0.2 1.2]);

% --- Verification at node points (should give identity matrix)
Ncheck = [ones(3,1), xi_nodes, xi_nodes.^2]*coeffs;
disp('Verification: N_i(xi_j) =');
disp(Ncheck);
