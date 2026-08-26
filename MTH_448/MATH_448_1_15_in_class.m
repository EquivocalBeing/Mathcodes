clc
x = pi/6;
x1 = pi/12;

disp("pi/6")
f_x = sin(x);
f_x_hat = x - ( x^3/factorial(3) ) + ( x^5/factorial(5) );

f_x_fwd_err = f_x - f_x_hat;
x_prime = asin(f_x - f_x_fwd_err);
x_bwd_err = x - x_prime;


disp("Forward Err:")
disp(f_x_fwd_err)

disp("Backward Err:")
disp(x_bwd_err)

%%
disp("pi/12")
f_x1 = sin(x1);
f_x1_hat = x1 - ( x1^3/factorial(3) ) + ( x1^5/factorial(5) );

f_x1_fwd_err = f_x1 - f_x1_hat;
x1_prime = asin(f_x1- f_x1_fwd_err);
x1_bwd_err = x1 - x1_prime;

disp("Forward Err:")
disp(f_x1_fwd_err)

disp("Backward Err:")
disp(x1_bwd_err)


