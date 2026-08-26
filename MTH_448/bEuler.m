function [yApprox, t] = bEuler(f, tInit,tFinal, n, y0 );

t = linspace(tInit, tFinal, n + 1);
dt = t(2) - t(1);
yApprox = zeros([1, n + 1]);
yApprox(1) = y0;

for i = 1:n
    r = @(y) y - yApprox(i) - dt * (-y);
    yApprox(i + 1) = fsolve(r, yApprox(i));
end

end