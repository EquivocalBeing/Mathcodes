% Carlos Campos
% MTH_448
% HW 1

clc
clear

%% P1

disp("P1")
disp("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
disp(" ")

% What are the approximate absolute and relative errors in approximating π by each of the following quantities?
% (a) 3

abs_err_1a = pi - 3;
rev_err_1a = (pi - 3)/ pi;

fprintf("(a)\nabsolute error\n")
disp(abs_err_1a)
disp("reletive error")
disp(rev_err_1a)

% (b) 3.14

abs_err_1b = pi - 3.14;
rev_err_1b = (pi - 3.14)/ pi;

fprintf("(b)\nabsolute error\n")
disp(abs_err_1b)
disp("reletive error")
disp(rev_err_1b)

% (c) 22/7

abs_err_1c = pi - (22/7);
rev_err_1c = (pi - (22/7))/ pi;

fprintf("(c)\nabsolute error\n")
disp(abs_err_1c)
disp("reletive error")
disp(rev_err_1c)

%% P2

disp("P2")
disp("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
disp(" ")

x = [0.1, 0.5, 1.0];


disp("(a)")
for i = 1:3
    f_x = sin(x(i));
    f_x_hat = x(i);
    
    f_x_fwd_err = f_x - f_x_hat;
    x_prime = asin(f_x - f_x_fwd_err);
    x_bwd_err = x(i) - x_prime;
    

    disp("Forward Err for " + x(i)+ ":")
    disp(f_x_fwd_err)
    
    disp("Backward Err " + x(i)+ ":")
    disp(x_bwd_err)
end

disp("(b)")
for i = 1:3
    f_x = sin(x(i));
    f_x_hat = x(i) - ( x(i)^3/factorial(3) );
    
    f_x_fwd_err = f_x - f_x_hat;
    x_prime = asin(f_x - f_x_fwd_err);
    x_bwd_err = x(i) - x_prime;
    

    disp("Forward Err for " + x(i)+ ":")
    disp(f_x_fwd_err)
    
    disp("Backward Err " + x(i)+ ":")
    disp(x_bwd_err)
end

%% P3

fprintf("P3\n" + ...
        "(a)\n" + ...
        "When x approaches 0. Since that is when a ~ b\n" + ...
        "(b)\n" + ...
        "2x/(1-x^2)\n\n")

%% P4

disp("P4")
disp("\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\")
disp(" ")

beta = 10;
p = 3;
l = -98;


disp("(a)")

ufl = beta^l;
disp("Underflow Level: " + ufl)


disp("(b)")

x4 = 6.87*10^-97;
y4 = 6.81*10^-97;
z4 = x4 - y4;

fprintf("x - y:\n" + z4 + "\n")


%% 2

f  = @(x) tan(x);
df = @(x) sec(x).^2;

x = 1;
h = logspace(-16,-1, 100);

error = zeros(size(h));
exact = df(x);

for k = 1:length(h)
    approx = (f(x + h(k)) - f(x)) / h(k);
    error(k) = abs(approx - exact);
end


figure;
loglog(h, error, 'o-', 'LineWidth', 1.5);
grid on;
xlabel('h');
ylabel('Absolute Err');
title('Finite Error');


[minError, idx] = min(error);
h_min = h(idx);

fprintf('Minimum error: %.3e\n', minError);
fprintf('Occurs at h = %.3e\n', h_min);



















