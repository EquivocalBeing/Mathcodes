%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                         %
% MATLAB CODE FOR FINITE ELEMENT ANALYSIS %
%          OF SPRING SYSTEMS              %
%                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all % clear memory
clc % clear Command Window

% --- INPUT DATA --- %

% elementNodes: connections at elements
elementNodes = [1 2;
                2 3;
                2 4];

% numberElements: number of Elements
numberElements = size(elementNodes,1);

% element stiffness matrix
k = [1 -1;
     -1 1];

C = [1;
     2;
     3]; % stiffness coefficient for each element

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
F(2) = 12;

% computation of the global stiffness matrix
for i = 1:numberElements
  % elementDof: element degrees of freedom (Dof)
  elementDof = elementNodes(i,:);
  K(elementDof,elementDof) = K(elementDof,elementDof) + C(i)*k;
  end 
%%
% --- BOUNDARY CONDITION --- %

% prescribed DoFs: known displacements
prescribedDof = [1;
                 3;
                 4]; 

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