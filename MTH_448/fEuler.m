function [yApprox, t] = fEuler(f, tInit,tFinal, n, y0 );

t = linspace(tInit, tFinal, n + 1);
dt = t(2) - t(1);
yApprox = zeros([1, n + 1]);
yApprox(1) = y0;

for i = 1:n
    yApprox(i + 1) = yApprox(i) + dt * f(t(i), yApprox(i));
end

end