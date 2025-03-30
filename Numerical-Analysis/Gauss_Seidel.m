%Gauss-Seidel
n = 10;

A = zeros(n,n);
for i=1:n
    if(i<=n-1)
        A(i+1,i) = -2;
        A(i,i+1) = -2;
    end
    A(i,i) = 5;
end

b(1) = 3;
b(n) = 3;
for i=2:n-1
    b(i) = 1;
end

m=1;
tolerance = 10^(-5);
x = zeros(n,1);
error = 100;
while error>tolerance
    new_x = x;
    for i=1:n
        Sum1=0;
        for j=1:i-1
            Sum1 =Sum1+A(i,j)*new_x(j);
        end
        Sum2=0;
        for j=i+1:n
            Sum2 =Sum2+A(i,j)*x(j);
        end
        new_x(i) = (1./A(i,i)) * (b(i) - Sum1 -Sum2);
    end
    max = 0;
    for k=1:n
        if abs(new_x(k)-x(k))>max
            max = abs(new_x(k)-x(k));
        end
    end
    error = max;
    x = new_x;
end
disp (new_x);