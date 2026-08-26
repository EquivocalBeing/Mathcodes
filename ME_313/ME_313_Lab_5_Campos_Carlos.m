clear all
close all
clc

disp('Lab #5')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem1

% elementNodes: connections at elements
elementNodes = [1 2;
                2 4;
                2 4;
                2 4;
                4 3];

% numberElements: number of Elements
numberElements = size(elementNodes,1);

% element stiffness matrix
k = [1 -1;
     -1 1];

C = [4;
     2;
     1;
     3;
     5]; % stiffness coefficient for each element

% numberNodes: number of nodes
numberNodes = 4;

% degree of freedom per node
dof = 1;

% total number of degrees of freedom
DoF = numberNodes * dof;

% displacements: displacement vector
d = zeros(DoF,1);
F = zeros(DoF,1);
K = zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node 2
F(2) = 4;

% computation of the global stiffness matrix
for i = 1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof = elementNodes(i,:);
  K(elementDof,elementDof) = K(elementDof,elementDof) + C(i)*k;
  end 
%
% --- BOUNDARY CONDITION --- %
% prescribed DoFs: known displacements
prescribedDof = [1;
                 3]; 

% unknown displacements: activeDof
activeDof = setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof) = K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% output for displacements and reaction forces
disp('Displacements are: ')
j=1:DoF;
Displacements=[j' d];
disp(Displacements)
% Global force vector
F=K*d;
% reaction force vector: reactions
reactions=F(prescribedDof);
disp('Reactions are: ')
Reactions=[prescribedDof reactions];
disp(Reactions)

%% Problem 2

% elementNodes: connections at elements
elementNodes = [1 2;
                2 3;
                2 3;
                2 4;
                3 4];

% numberElements: number of Elements
numberElements = size(elementNodes,1);

% element stiffness matrix
k = [1 -1;
     -1 1];

C = [250;
     400;
     350;
     200;
     300]; % stiffness coefficient for each element

% numberNodes: number of nodes
numberNodes = 4;

% degree of freedom per node
dof = 1;

% total number of degrees of freedom
DoF = numberNodes * dof;

% displacements: displacement vector
d = zeros(DoF,1);
F = zeros(DoF,1);
K = zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node 3
F(3) = 1000;

% computation of the global stiffness matrix
for i = 1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof = elementNodes(i,:);
  K(elementDof,elementDof) = K(elementDof,elementDof) + C(i)*k;
  end 
%
% --- BOUNDARY CONDITION --- %
% prescribed DoFs: known displacements
prescribedDof = [1;
                 3]; 

% unknown displacements: activeDof
activeDof = setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof) = K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% output for displacements and reaction forces
disp('Displacements [mm] are: ')
j=1:DoF;
Displacements=[j' d];
disp(Displacements)
% Global force vector
F=K*d;
% reaction force vector: reactions
reactions=F(prescribedDof);
disp('Reactions are: ')
Reactions=[prescribedDof reactions];
disp(Reactions)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Hint for Problem 3a
% --- INPUT DATA --- %

L= 30; % bar length
E= 10^6; % Young's modulus
A0= 2; % initial cross section area

%%%%%%%%%%%%%%%
% CASE I: N=3 %
%%%%%%%%%%%%%%%

% numberElements: number of Elements
numberElements= 3;
% elementNodes: connections at elements
numberNodes=numberElements+1;
elementNodes=zeros(numberElements,2);

for i=1:numberElements
    elementNodes(i,1)=i;
    elementNodes(i,2)=i+1;
end

% element stiffness matrix
k = [1 -1;
     -1 1];

% degree of freedom per node
dof = 1;
% total number of degrees of freedom
DoF=numberNodes*dof;
% displacements: displacement vector
d=zeros(DoF,1);
F=zeros(DoF,1);
K=zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node #
F(1)=-1500;

% computation of the global stiffness matrix
for i=1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof=elementNodes(i,:);

  Le=L/numberElements;       % element length

  x=i*Le-Le*1/2;             % current x position

  A=A0*(1+x/L);              % cross section area            

  C=E*A/Le;                  % stiffness coefficient for each element

  K(elementDof,elementDof)=K(elementDof,elementDof)+C*k;
end 

% --- BOUNDARY CONDITION --- %

% prescribed DoFs: known displacements
prescribedDof=(numberNodes); 
% unknown displacements: activeDof
activeDof=setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof)=K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% output for displacements and reaction forces
disp('Displacements are (Case I: N=3): ')
j=1:DoF;
[j' d]

% Final displacement for CASE I N=3: displacement3
displacement3=d;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%
% CASE II: N=5 %
%%%%%%%%%%%%%%%

% numberElements: number of Elements
numberElements= 5;
% elementNodes: connections at elements
numberNodes=numberElements+1;
elementNodes=zeros(numberElements,2);

for i=1:numberElements
    elementNodes(i,1)=i;
    elementNodes(i,2)=i+1;
end

% element stiffness matrix
k = [1 -1;
     -1 1];

% degree of freedom per node
dof = 1;
% total number of degrees of freedom
DoF=numberNodes*dof;
% displacements: displacement vector
d=zeros(DoF,1);
F=zeros(DoF,1);
K=zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node #
F(1)=-1500;

% computation of the global stiffness matrix
for i=1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof=elementNodes(i,:);

  Le=L/numberElements;       % element length

  x=i*Le-Le*1/2;             % current x position

  A=A0*(1+x/L);              % cross section area            

  C=E*A/Le;                  % stiffness coefficient for each element

  K(elementDof,elementDof)=K(elementDof,elementDof)+C*k;
end 

% --- BOUNDARY CONDITION --- %

% prescribed DoFs: known displacements
prescribedDof=(numberNodes); 
% unknown displacements: activeDof
activeDof=setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof)=K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% output for displacements and reaction forces
disp('Displacements are (Case I: N=5): ')
j=1:DoF;
[j' d]

% Final displacement for CASE I N=3: displacement3
displacement5=d;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%
% CASE III: N=7 %
%%%%%%%%%%%%%%%

% numberElements: number of Elements
numberElements= 7;
% elementNodes: connections at elements
numberNodes=numberElements+1;
elementNodes=zeros(numberElements,2);

for i=1:numberElements
    elementNodes(i,1)=i;
    elementNodes(i,2)=i+1;
end

% element stiffness matrix
k = [1 -1;
     -1 1];

% degree of freedom per node
dof = 1;
% total number of degrees of freedom
DoF=numberNodes*dof;
% displacements: displacement vector
d=zeros(DoF,1);
F=zeros(DoF,1);
K=zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node #
F(1)=-1500;

% computation of the global stiffness matrix
for i=1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof=elementNodes(i,:);

  Le=L/numberElements;       % element length

  x=i*Le-Le*1/2;             % current x position

  A=A0*(1+x/L);              % cross section area            

  C=E*A/Le;                  % stiffness coefficient for each element

  K(elementDof,elementDof)=K(elementDof,elementDof)+C*k;
end 

% --- BOUNDARY CONDITION --- %

% prescribed DoFs: known displacements
prescribedDof=(numberNodes); 
% unknown displacements: activeDof
activeDof=setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof)=K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% output for displacements and reaction forces
disp('Displacements are (Case I: N=7): ')
j=1:DoF;
[j' d]

% Final displacement for CASE I N=7: displacement7
displacement7=d;


%---PLOTS---%
x1 = 0:L/3:L; % x vector for case I
x2 = 0:L/5:L; % x vector for case II
x3 = 0:L/7:L; % x vector for case II
x = 0:L/30:L; % analytical soln

analytical = 1500 * L/ (A0 * E) * log((L + x) / (2*L)); %analytical solution

plot(x1, displacement3, 'r', x2, displacement5, x3, displacement7, 'g', x, analytical, 'b')
title('Position Vs Displacement')
xlabel('Position')
ylabel('Displacement')
legend('3 Elements', '5 Elements', '7 Elements', 'Analytical')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Hint for Problem 3b
% --- INPUT DATA --- %
L= 30;   % bar length
E= 10^6; % Young's modulus
A0= 2;   % initial cross section area

N = [2;
     4;
     8;
     12;
     16;
     20]; % all finite element discretization schemes
displacement=zeros(6,3); % first column is N, second column is displacement at the tip, third column is analytical solution


for n=1:6 % You want to figure out 1 to what number

displacement(n,1) = N(n, 1);
% numberElements: number of Elements
numberElements = N(n, 1);
% elementNodes: connections at elements
numberNodes = numberElements + 1;
elementNodes = zeros(numberElements, 2);


for i = 1:numberElements
    elementNodes(i,1) = i;
    elementNodes(i,2) = i+1;
end

% element stiffness matrix
k = [1 -1;
     -1 1];
% degree of freedom per node
dof=1;
% total number of degrees of freedom
DoF=numberNodes*dof;
% displacements: displacement vector
d=zeros(DoF,1);
F=zeros(DoF,1);
K=zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node #
F(1)= -1500;

% computation of the global stiffness matrix
for i=1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof=elementNodes(i,:);
  Le=L/numberElements; % element length
  x=i*Le-Le*1/2; % current x position
  A=A0*(1+x/L); % cross section area
  C=E*A/Le; % stiffness coefficient for each element
  K(elementDof,elementDof)=K(elementDof,elementDof)+C*k;
end 

% --- BOUNDARY CONDITION --- %

% prescribed DoFs: known displacements
prescribedDof=(numberNodes); 
% unknown displacements: activeDof
activeDof=setdiff(1:numberNodes,prescribedDof);

% solution
d(activeDof)=K(activeDof,activeDof)\F(activeDof);

% --- RESULTS --- %

% Displacement at the tip for each case
displacement(n,2)=d(1,1);
end
% analytical solution
x = 0;
analytical = 1500 * L/ (A0 * E) * log((L + x) / (2*L));
displacement(:,3) = analytical;

% --- PLOTS --- %

plot(displacement(:,1),displacement(:,2),'r', displacement(:,1),displacement(:,3), 'b')
title('Convergence Study')
xlabel('Number of Elements')
ylabel('Deflection [in]')
legend('FE Soln', 'Analytical Soln')

