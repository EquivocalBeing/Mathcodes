% Plot cubic Hermite shape functions and their derivatives
% N1..N4 as provided in the screenshot
clear; close all; clc;

% --- Parameters
L = 1;                      % set L = 1 for plotting (change if you like)
x = linspace(0, L, 501);    % dense x for plotting

% --- define shape functions (vectorized)
N1 = (1/L^3) .* ( 2.*x.^3 - 3.*x.^2 .* L + L^3 );
N2 = (1/L^3) .* ( x.^3 .* L - 2.*x.^2 .* L.^2 + x .* L.^3 );
N3 = (1/L^3) .* ( -2.*x.^3 + 3.*x.^2 .* L );
N4 = (1/L^3) .* ( x.^3 .* L - x.^2 .* L.^2 );

% --- derivatives (analytical forms) -- see section 2 for derivation
dN1 = (6.*x.^2 - 6.*L.*x) ./ L^3;
dN2 = (3.*x.^2 - 4.*L.*x + L^2) ./ L^2;
dN3 = (-6.*x.^2 + 6.*L.*x) ./ L^3;
dN4 = (3.*x.^2 - 2.*L.*x) ./ L^2;

% --- Plot shape functions
figure('Name','Shape functions N_i','NumberTitle','off');
plot(x, N1, 'LineWidth', 2); hold on
plot(x, N2, 'LineWidth', 2);
plot(x, N3, 'LineWidth', 2);
plot(x, N4, 'LineWidth', 2);
grid on; xlabel('x'); ylabel('N_i(x)'); title('Cubic beam shape functions (L=1)');
legend('N_1','N_2','N_3','N_4','Location','best');
ylim([-0.5 1.5]);

% --- Plot derivatives
figure('Name','dN_i/dx','NumberTitle','off');
plot(x, dN1, 'LineWidth', 2); hold on
plot(x, dN2, 'LineWidth', 2);
plot(x, dN3, 'LineWidth', 2);
plot(x, dN4, 'LineWidth', 2);
grid on; xlabel('x'); ylabel('dN_i/dx'); title('Derivatives dN_i/dx (L=1)');
legend('dN_1/dx','dN_2/dx','dN_3/dx','dN_4/dx','Location','best');

% --- Quick numeric checks at nodes (x=0, x=L/2, x=L)
xp = [0, L/2, L];
Np = [ ...
    (1/L^3)*(2*xp(1)^3 - 3*xp(1)^2*L + L^3), ...
    (1/L^3)*(xp(1)^3*L - 2*xp(1)^2*L^2 + xp(1)*L^3), ...
    (1/L^3)*(-2*xp(1)^3 + 3*xp(1)^2*L), ...
    (1/L^3)*(xp(1)^3*L - xp(1)^2*L^2); 
    (1/L^3)*(2*xp(2)^3 - 3*xp(2)^2*L + L^3), ...
    (1/L^3)*(xp(2)^3*L - 2*xp(2)^2*L^2 + xp(2)*L^3), ...
    (1/L^3)*(-2*xp(2)^3 + 3*xp(2)^2*L), ...
    (1/L^3)*(xp(2)^3*L - xp(2)^2*L^2);
    (1/L^3)*(2*xp(3)^3 - 3*xp(3)^2*L + L^3), ...
    (1/L^3)*(xp(3)^3*L - 2*xp(3)^2*L^2 + xp(3)*L^3), ...
    (1/L^3)*(-2*xp(3)^3 + 3*xp(3)^2*L), ...
    (1/L^3)*(xp(3)^3*L - xp(3)^2*L^2) ];

disp('N_i at x=0, x=L/2, x=L (rows correspond to nodes):');
disp(Np);

% check partition of unity at a few x
sumN = N1 + N2 + N3 + N4;
fprintf('Max deviation from partition of unity on grid: %g\n', max(abs(sumN-1)));
