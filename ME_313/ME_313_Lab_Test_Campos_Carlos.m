%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                         %
% MATLAB CODE FOR FINITE ELEMENT ANALYSIS %
%          OF TRUSS SYSTEMS               %
%                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear 
close all % clear memory
clc % clear Command Window

% --- INPUT DATA --- %

% E; modulus of elasticity
% A: area of cross section
E=1e6; A=4; EA=E*A;

theta = 120; % deg

% generation of coordinates and connectivities
numberElements = 3;
numberNodes = 4;
elementNodes=[1 4;  % [1]
              1 3;  % [2] %% It didn't like when I had all the elements attached the 3. So, I changed the nodes around
              1 2]; % [3] %% So: (3) -> (1), (1) -> (2), (2) -> (3). (4) stays the same.

%                (1)   (2)    (3)   (4)  
nodeCoordinates=[0 0; 60 0; 60 -60; 0 60]; % in
xx=nodeCoordinates(:,1);
yy=nodeCoordinates(:,2);

% degree of freedom per node
dof=2;

% for structure:
    % d: displacement vector
    % F : force vector
    % K: stiffness matrix
    
DoF=dof*numberNodes; % DoF: total number of degrees of freedom
d=zeros(DoF,1);
F=zeros(DoF,1);
K=zeros(DoF); 

% --- LOAD DEFINITION --- %

% applied load at node 3
F(1) = -10000 * cosd(theta - 90); % x axis
F(2) = -10000 * sind(theta - 90); % y axis

% computation of the system stiffness matrix
for i=1:numberElements
  % elementDof: element degrees of freedom (Dof)
  index=elementNodes(i,:);       
  elementDof=[index(1)*2-1 index(1)*2 index(2)*2-1 index(2)*2];
  xa=xx(index(2))-xx(index(1)); % Length in x direction
  ya=yy(index(2))-yy(index(1)); % Length in y direction
  L=sqrt(xa*xa+ya*ya); % length of bar
  C=xa/L; % cosine
  S=ya/L; % sine
  % stiffness matrix for bar element
   k=EA/L*[C*C C*S -C*C -C*S;
           C*S S*S -C*S -S*S;
           -C*C -C*S C*C C*S;
           -C*S -S*S C*S S*S];    

  K(elementDof, elementDof) = K(elementDof, elementDof) + k;
end 

% --- BOUNDARY CONDITION --- %

% prescribed DoFs
prescribedDof = [3;4;5;7;8];

% --- SOLUTION --- %

% unknown displacements: activeDof
activeDof=setdiff((1:DoF)',prescribedDof);
disp('Displacements are:')
d(activeDof) = K(activeDof,activeDof)\F(activeDof,1)

% --- RESULTS --- %

% graphics output for undeformed and deformed structure

% undeformed structure
Xundeformed=zeros(numberElements*2,1); % X vector for undeformed structure
Yundeformed=zeros(numberElements*2,1); % Y vector for undeformed structure
for i=1:numberElements
  Xundeformed(2*i-1,1)=nodeCoordinates(elementNodes(i,1),1);
  Xundeformed(2*i,1)=nodeCoordinates(elementNodes(i,2),1);
  Yundeformed(2*i-1,1)=nodeCoordinates(elementNodes(i,1),2);
  Yundeformed(2*i,1)=nodeCoordinates(elementNodes(i,2),2);
end
% deformed structure
Xdeformed=zeros(numberElements*2,1); % X vector for deformed structure
Ydeformed=zeros(numberElements*2,1); % Y vector for deformed structure
u=1:2:2*numberNodes-1; % x components of displacement
v=2:2:2*numberNodes; % y components of displacement
X=d(u);Y=d(v);
% scaling factor
scaleFact=1500;
nodeCoordinatesDeformed=zeros(numberNodes,2);
nodeCoordinatesDeformed(:,1)=nodeCoordinates(:,1)+X*scaleFact;
nodeCoordinatesDeformed(:,2)=nodeCoordinates(:,2)+Y*scaleFact;

for i=1:numberElements
  Xdeformed(2*i-1,1)=nodeCoordinatesDeformed(elementNodes(i,1),1);
  Xdeformed(2*i,1)=nodeCoordinatesDeformed(elementNodes(i,2),1);
  Ydeformed(2*i-1,1)=nodeCoordinatesDeformed(elementNodes(i,1),2);
  Ydeformed(2*i,1)=nodeCoordinatesDeformed(elementNodes(i,2),2);
end

plot(Xundeformed,Yundeformed,'black',Xdeformed,Ydeformed,'r --','LineWidth',2)
axis([min(nodeCoordinatesDeformed(:,1))-5 max(nodeCoordinatesDeformed(:,1))+5 min(nodeCoordinatesDeformed(:,2))-5  max(nodeCoordinatesDeformed(:,2))+5])
legend('Undeformed structure','Deformed structure')
% stress for each element
sigma=zeros(numberElements,1);
for i=1:numberElements                          
  index=elementNodes(i,:);
  elementDof=[index(1)*2-1 index(1)*2 index(2)*2-1 index(2)*2];
  xa=xx(index(2))-xx(index(1));
  ya=yy(index(2))-yy(index(1));
  L=sqrt(xa*xa+ya*ya);
  C=xa/L;
  S=ya/L;   
  sigma(i,1)=E/L*[-C  -S C S]*d(elementDof); 
end    
disp('Stress for each element is:')
disp(sigma);
