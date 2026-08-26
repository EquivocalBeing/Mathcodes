clear all
close all
clc

disp('Lab #1')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem 1
disp('Problem 1');

% I know in lab you used a different syntax, but this is what I'm used to
% doing in python. Hope that's ok. If not, please let me know.
a = [[6, 5, -7], 
     [9, -2, 3],
     [1, -3, 4]];

b = [[3, 2, 5],
     [0, -1, 7],
     [-4, 9, 3]];

% (a)

disp('-----------------------');
disp('1_a:');
disp(a + b);

% (b)

disp('-----------------------');
disp('1_b:');
disp(b - 2*a);

% (c)

disp('-----------------------');
disp('1_c:');
disp(a * b);

% (d)

disp('-----------------------');
disp('1_d:');
disp(b * a);

% (e)

disp('-----------------------');
disp('1_e:');
disp(a^2 + b^2);

%% Problem 2
disp('Problem 2');

a_2 = [[3, 0, 5], 
     [1, -2, 6],
     [7, 4, 5]];

b_2 = [[8, 1, 2], 
     [6, -3, 7], 
     [2, 1, 4]];

% (a)

da = det(a_2);
db = det(b_2);
dab = det(a_2 * b_2);
datb = det(a_2) * det(b_2);

disp('-----------------------');
disp('2_a:');
fprintf('det(A): %s\n', num2str(da));
fprintf('det(B): %s\n', num2str(db));
fprintf('det(AB): %s\n', num2str(dab));
fprintf('det(A)det(B): %s\n', num2str(datb));
disp('Yes, they equal each other');

% (b)

i_a = inv(a_2);
d_i_a = det(i_a);
one_a = 1 / det(a_2);

disp('-----------------------');
disp('2_b:');
fprintf('det(A^-1): %s\n', num2str(d_i_a));
fprintf('1/det(A): %s\n', num2str(one_a));
disp('Yes, they equal each other');

% (c)

i_ab = inv(a_2 * b_2);
i_b = inv(b_2);
i_ba = i_b * i_a;

disp('-----------------------');
disp('2_c:');
disp('AB^-1:');
disp(i_ab);
disp('B^-1A^-1:'); 
disp(i_ba);
disp('Yes, they equal each other');

% (d)

disp('-----------------------');
disp('2_d:');
alpha = a_2(:,2:3);
fprintf('A(:,2:3): %s\n', mat2str(alpha));

c = a_2(:,2);

fprintf('C: %s\n', mat2str(c));

disp(['A(:,2:3) selects the second and third columns of A. While, C ' ...
      'only selects the second column']);

% (e)

disp('-----------------------');
disp('2_e:');
beta = b_2(1:2,2:3);
fprintf('B(1:2,2:3): %s\n', mat2str(beta));

d = b_2(:,1);

fprintf('D: %s\n', mat2str(d));
disp(['"B(1:2,2:3)" is selecting the second and third rows of the second ' ...
      'and third colums. While, "D" is selecting the first column.']);

% (f)

a_2(2,1:3) = b_2(3,1:3);

disp('-----------------------');
disp('2_f:');
disp('New A matrix:')
disp(a_2)
disp("This changes the values in A matrix's second row to the values "+ ...
     "in the B matrix's third row")

% (g)

stdf_cd = setdiff(c,d);

disp('-----------------------');
disp('2_g:');
disp(stdf_cd);
disp('Setdiff returns the values in A that are not repeated in B')


%% Problem 3:

a_3 = [[1, 0, 5],
       [7, -3, 2],
       [4, 1, 3]];

b_3 = [[6, 1, 7],
       [-4, 2, -2],
       [5, 1, 1]];

% (a)

a_t = transpose(a_3);
b_t = transpose(b);

disp('-----------------------');
disp('3_a:');
disp(a_t);
disp(b_t);


% (b)

i_a_3 = inv(a_3);
i_b_3 = inv(b_3);

disp('-----------------------');
disp('3_b:');
disp(i_a_3);
disp(i_b_3);


% (c)

q = b_3(:,1);

x = i_a_3 * q;

disp('-----------------------');
disp('3_c:');
disp("Q:")
disp(q);
disp("X:")
disp(x);

% (d)

i = a_3 * i_a_3;

disp('-----------------------');
disp('3_d:');
disp('A*A^-1:')
disp(i);


% (e)

c_3 = [a_3, a_3];

d_3 = [a_3; a_3];

disp('-----------------------');
disp('3_e:');
disp(c_3);
disp('-----------------------');
disp(d_3);

disp(['C constructs a 3x6 with two A matrices. D makes a 6x3 with the ' ...
      'using the same A matrix'])

%% Problem 4

a_4 = [[1, 2, 4],
     [3, 9, 2],
     [7, 2, 5]];
% (a)

disp('-----------------------');
disp('4_a:');
x_3 = a_4(1,:);
disp(x_3);

% (b)

y_3 = a_4(a_4(2:3,:));

disp('-----------------------');
disp('4_b:');
disp(y_3);

% (c)

s_a_c = sum(a_4);

disp('-----------------------');
disp('4_c:');
disp(s_a_c);

% (d)

s_a_r = sum(a_4, 2);

disp('-----------------------');
disp('4_d:');
disp(s_a_r);

%% Problem 5

% (a)

disp('-----------------------');
disp('5_a:');
for i = 2:2:12
    disp(i)
end

% (b)
disp('-----------------------');
disp('5_b:');
for i = 15:-3:0
    disp(i)
end


%% Problem 6

% (a)

disp('-----------------------');
disp('6_a:');
gamma = 2:2:12;
disp(gamma);
% (b)

disp('-----------------------');
disp('6_b:');
delta = 15:-3:0;
disp(delta);

%% Problem 7

% (a)

disp('-----------------------');
disp('7_a:');
a_7 = zeros(4);
disp(a_7)

% (b)

disp('-----------------------');
disp('7_b:');
for i = 1:4
    for j = 1:4
        if i == j
            a_7(i,j) = 1;
        end
    end
end

disp(a_7)

%% Problem 8

% (a)
a_8 = input('enter a 3x3 matrix = ');

% (b)

epsilon = a_8(1,3);
zeta = a_8(2,3);
eta = a_8(3,3);

disp('-----------------------');
disp('7_b:');
disp('A(1,3)');
disp(epsilon);

disp('A(2,3)');
disp(zeta);

disp('A(3,3)');
disp(eta);
% (c)

theta = a_8(2,1);

disp('-----------------------');
disp('7_c:');

if  theta > 0
    disp('the number is > 0')
    % disp(epsilon)

elseif theta == 0
    disp('number = 0')

% (d)
elseif theta < 0
    disp('number is < 0')
end