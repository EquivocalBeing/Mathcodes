function midpoint_integration()
    clc; clear
    a = 0;  b = 1;  n = 1000;
    exact = -4/9;

    h  = (b - a) / n;
    midpoints = (0.5 : n - 0.5) * h;
    f  = sqrt(midpoints) .* log(midpoints);
    approx  = h * sum(f);

    int_value = integral(@(x) sqrt(x).*log(x), a, b);

    fprintf('Exact value:             %.10f\n', exact);
    
    fprintf('MATLAB integral():       %.10f\n', int_value);
    fprintf('Midpoint Rule (n=%d):  %.10f\n', n, approx);
    fprintf('Error:                    %.2e\n',  abs(approx - exact));

end