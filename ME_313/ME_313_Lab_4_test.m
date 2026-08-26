clear all
close all
clc

disp('Lab #3')
disp('Name: Carlos A. Campos')
disp('ID: 011903056')

%% Problem 1
disp('Problem 1');

u1 = 0;    f2 = 0;
u5 = 0;    f3 = f2;    f4 = f2;

K = [  1,   0,    0,    0,    0;
     -200, 400, -200,   0,    0;   
       0, -200,  400, -200,   0;
       0,   0,  -200,  400, -200; 
       0,   0,    0,    0,   -1 ];

F = [u1;
     f2;
     f3;
     f4;
     u5];



































