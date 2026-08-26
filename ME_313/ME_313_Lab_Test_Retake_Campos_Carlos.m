clear all
close all
clc

disp('Lab Test Retake')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')
%%  Problem 1


% --- INPUT DATA --- %

% E; modulus of elasticity
% A: area of cross section
E = 6e6; A = 3; EA=E*A;

theta = 60;     %deg
force = 30000;  %lbf

% generation of coordinates and connectivities
numberElements=3;
numberNodes=4;
elementNodes=[3 1;  % [1]
              3 4;  % [2]
              3 2]; % [3]

%                (1)    (2)   (3)   (4) 
nodeCoordinates=[0 0; -144 0; -72 72; -108 144]; % in
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
F(5) = force * cosd(theta); %lbf
F(6) = force * sind(theta);

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
prescribedDof = [2; 3; 4; 7; 8];

% --- SOLUTION --- %

% unknown displacements: activeDof
activeDof=setdiff((1:DoF)',prescribedDof);
d(activeDof) = K(activeDof,activeDof)\F(activeDof,1);

disp("///////////////////////////////////////////////////////////////////");
disp('u1 [in]:');
disp(d(1) );

disp('v3 [in]:');
disp(d(6) );

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
disp('Sigma 3 [psi]:')
disp(sigma(3));