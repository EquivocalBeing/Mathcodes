% Problem 1
clear all
close all
clc

disp('Lab #6')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

% Geometric characteristics
A = 5 *10^-4;   %m
E = 200;        % GPa
Lx = 4;% Length for X
Ly = 3;% Length for Y
Lh = sqrt(Lx^2 + Ly^2);
theta1 = acos(Lx/Lh);
theta2 = 90;
% c1=Lx/Lh; % cosine for element 1
% s1=Ly/Lh; % sine for element 1
% c2=cosd(90); % cosine 90 degree
% s2=sind(90); % sine 90 degree
delta = -0.05; % meter
F1y = 1000000; % N
u2 = 0;     v2 = 0;    u3 = 0;    v3 = 0;
% Stiffness
% k1=A*E/Lh*[1 0 -1 0;0 0 0 0;-1 0 1 0;0 0 0 0];
% k2=A*E/Lx*[1 0 -1 0;0 0 0 0;-1 0 1 0;0 0 0 0];
k1 = k_prime(E,A,Lh);
k2 = k_prime(E,A,Ly);
% Transformation matrix
% T1=[c1 s1 0 0;-s1 c1 0 0;0 0 c1 s1;0 0 -s1 c1];
% T2=[c2 s2 0 0;-s2 c2 0 0;0 0 c2 s2;0 0 -s2 c2];
T1 = T(theta1);
T2 = T(theta2);
% global stiffness matrix
% k1g=T1'*k1*T1;
% k2g=T2'*k2*T2;
k1g = k(E, A, Lh, theta1);
k2g = k(E, A, Ly, theta2);
% Global stiffness matrix of the system
K = zeros(6);
% Element 1
K(1:4,1:4) = k1g;
% Element 2
K(2,2)=K(2,2)+k2g(2,2);
K(2,6)=K(2,6)+k2g(2,4);
K(6,2)=K(6,2)+k2g(4,2);
K(6,6)=K(6,6)+k2g(4,4);
% Boundary conditions
K_mod = eye(6);
K_mod(2,1:end) = K(2,1:end);
F_mod = [delta; 
          F1y;
          u2; 
          v2; 
          u3; 
          v3];

% Solution
d = K_mod \ F_mod;

% Displacement vector for each element-Global coordinate system
d1 = [d(1,1); 
      d(2,1); 
      d(3,1); 
      d(4,1)];

d2 = [d(1,1); 
      d(2,1);
      d(5,1); 
      d(6,1)];
% Displacement vector for each element-Local coordinate system
d1local = T1 * d1;
d2local = T2 * d2;
% Internal forces for each element
f1 = k1 .* d1local;
f2 = k2 .* d2local;
% Stress for each element in MPa
fprintf("Stress for element 1")
stresElement1 = f1/A/1000000 % MPa
fprintf("Stress for element 2")
stresElement2 = f2/A/1000000 % MPa
% Elongation for each element
fprintf("Elongation for element 1:")
elongationElement1 = d1local(3) - d1local(1)
fprintf("Elongation for element 2:")
elongationElement2 = d2local(3) - d2local(1)
% Strain for each element
fprintf("Strain for element 1:")
strainElement1 = elongationElement1/Lh
fprintf("Strain for element 2:")
strainElement2 = elongationElement2/Ly

%%
% ANSYS
% Q2
disp(' ')
disp('ANSYS Q2')
disp('1.	Displacement at node 4 along x-axis = 0.011 in ')
disp('2.	Displacement at node 4 along y-axis = 0.011 in ')
disp('3.	Axial force at element 5 = 9500 lbf')
disp('4.	Reaction for at node 3; x:  0.00021 lbf	 y:  0.00021 lbf')
