clear all
close all
clc

disp('Lab #4')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem1
% Known B.C.
u1 = 0;
u5 = 0.02;
F2 = 0;
F3 = F2;
F4 = F2;
% k_element
k = [ 200, -200;
    -200, 200];
% Expend K 
K= zeros(5);
k1_exp = K;
k2_exp = K;
k3_exp = K;
k4_exp = K;
k1_exp(1:2,1:2) = k;
k2_exp(2:3,2:3) = k;
k3_exp(3:4,3:4) = k;
k4_exp(4:5,4:5) = k;
% K global
K = k1_exp + k2_exp + k3_exp + k4_exp;

% K modify with known B.C.
K_mod = eye(5);
K_mod(2:4,1:end) = K(2:4,1:end);

% F modify with known B.C.
F_mod = [u1; 
         F2; 
         F3; 
         F4;
         u5];

% Find D and F
D = K_mod \ F_mod;
F = K*D;
% Internal force for each element
f1 = k*D(1:2);
f2 = k*D(2:3);
f3 = k*D(3:4);
f4 = k*D(4:5);

disp('-----------------------');
disp('D:');
disp(D);

disp('-----------------------');
disp('K:');
disp(K);

disp('-----------------------');
disp('F:');
disp(F)

disp('-----------------------');
disp('f1:');
disp(f1)

disp('-----------------------');
disp('f2:');
disp(f2)

disp('-----------------------');
disp('f3:');
disp(f3)

disp('-----------------------');
disp('f4:');
disp(f4)


%% Problem 2
%Known B.C.
u1 = 0;
u9 = 0.09;
F2 = 0;
F3 = 0;
F4 = 0;
F5 = 0;
F6 = 0;
F7 = 0;
F8 = 0;

% k_element
k1 = [ 200, -200;
      -200,  200];

k2 = [ 300, -300;
     -300,  300];

% K global
K = zeros(9);
K(1:2,1:2) = k1;
K(2:3,2:3) = K(2:3,2:3) + k1;
K(3:4,3:4) = K(3:4,3:4) + k1;
K(4:5,4:5) = K(4:5,4:5) + k1;
K(5:6,5:6) = K(5:6,5:6) + k2;
K(6:7,6:7) = K(6:7,6:7) + k2;
K(7:8,7:8) = K(7:8,7:8) + k2;
K(8:9,8:9) = K(8:9,8:9) + k2;

% K modify with known B.C.
K_mod = eye(9);
K_mod(2:8,1:end) = K(2:8,1:end);

% F modify with known B.C.
F_mod = [u1; 
         F2; 
         F3; 
         F4;
         F5;
         F6;
         F7;
         F8;
         u9];

% Find D and F
D = K_mod \ F_mod;
F = K * D;

% Internal force for each element
f1 = k*D(1:2);
f2 = k*D(2:3);
f3 = k*D(3:4);
f4 = k*D(4:5);
f5 = k*D(5:6);
f6 = k*D(6:7);
f7 = k*D(7:8);
f8 = k*D(8:9);


disp('-----------------------');
disp('D:');
disp(D);

disp('-----------------------');
disp('K:');
disp(K);

disp('-----------------------');
disp('F:');
disp(F)

disp('-----------------------');
disp('f1:');
disp(f1)

disp('-----------------------');
disp('f2:');
disp(f2)

disp('-----------------------');
disp('f3:');
disp(f3)

disp('-----------------------');
disp('f4:');
disp(f4)

disp('-----------------------');
disp('f5:');
disp(f5)

disp('-----------------------');
disp('f6:');
disp(f6)

disp('-----------------------');
disp('f7:');
disp(f7)

disp('-----------------------');
disp('f8:');
disp(f8)


%% Problem 3
%Known B.C.
u1 = 0;    % m
u9 = 0;    % m
F2 = 0;
F3 = 0;
F4 = 0;
F5 = 0;
F6 = 2000; % kN
F7 = 0;
F8 = 0;

% k_element
k1 = [ 200, -200;
      -200,  200];

k2 = [ 300, -300;
     -300,  300];

% K global
K = zeros(9);
K(1:2,1:2) = k1;
K(2:3,2:3) = K(2:3,2:3) + k1;
K(3:4,3:4) = K(3:4,3:4) + k1;
K(4:5,4:5) = K(4:5,4:5) + k1;
K(5:6,5:6) = K(5:6,5:6) + k2;
K(6:7,6:7) = K(6:7,6:7) + k2;
K(7:8,7:8) = K(7:8,7:8) + k2;
K(8:9,8:9) = K(8:9,8:9) + k2;

% K modify with known B.C.
K_mod = eye(9);
K_mod(2:8,1:end) = K(2:8,1:end);

% F modify with known B.C.
F_mod = [u1; 
         F2; 
         F3; 
         F4;
         F5;
         F6;
         F7;
         F8;
         u9];

% Find D and F
D = K_mod \ F_mod;
F = K * D;

% Internal force for each element
f1 = k*D(1:2);
f2 = k*D(2:3);
f3 = k*D(3:4);
f4 = k*D(4:5);
f5 = k*D(5:6);
f6 = k*D(6:7);
f7 = k*D(7:8);
f8 = k*D(8:9);


disp('-----------------------');
disp('D:');
disp(D);

disp('-----------------------');
disp('K:');
disp(K);

disp('-----------------------');
disp('F:');
disp(F)

disp('-----------------------');
disp('f1:');
disp(f1)

disp('-----------------------');
disp('f2:');
disp(f2)

disp('-----------------------');
disp('f3:');
disp(f3)

disp('-----------------------');
disp('f4:');
disp(f4)

disp('-----------------------');
disp('f5:');
disp(f5)

disp('-----------------------');
disp('f6:');
disp(f6)

disp('-----------------------');
disp('f7:');
disp(f7)

disp('-----------------------');
disp('f8:');
disp(f8)