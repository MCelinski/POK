clear;
close all;

%% implementation of variables.

syms x y z g 

eq1 = 2*x + y + z - g == 3;
eq2 = x + y - z + g == 4;
eq3 = x + y + z + g == 10;
eq4 = -x + 2*y - z + g == 4;

%% Turning equations in to a matrix and then combining them.

[a,b] = equationsToMatrix([eq1, eq2, eq3, eq4], [x, y, z, g]);
a = [a b];

%% Gauss elimination method.

[m,n]=size(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0
            t=a(j,:);a(j,:)=a(z,:);
            a(z,:)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c=c+a(s,k)*x(k);
    end
    x(s)=(a(s,n)-c)/a(s,s);
end

%% Displaying the results.

disp('Gauss elimination method:');
a
x'
