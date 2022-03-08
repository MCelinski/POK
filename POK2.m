clear;
close all;

%% implementation of variables.
syms x y z g 

eq1 = 2*x + y + z - g == 3;
eq2 = x + y - z + g == 4;
eq3 = x + y + z + g == 10;
eq4 = -x + 2*y - z + g == 4;

%% Turning equations in to a 2 matrices and then combining them.
[a,b] = equationsToMatrix([eq1, eq2, eq3, eq4], [x, y, z, g]);
A=[a,b];
P=[a,b];
P(:,5)=[];

%% Solving the equation
X=linsolve(a,b);

%% Rank of matrix
UnknownValues=size(X,1);
rankA=rank(A);
rankP=rank(P);

%% Kronecker Capelli Theorem 
if (rankA==rankP) && (rankP==UnknownValues)
    disp('Only one solution: ')
    disp(X)
elseif (rankP==rankA && rankA<UnknownValues)
    disp('inifinite numbers of solutions ')
else
    disp('zero solutions')
end




