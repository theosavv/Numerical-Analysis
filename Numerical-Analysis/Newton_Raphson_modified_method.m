% H συνάρτηση f
format long;
f_x = @(x) 94.*(cos(x).^3) - 24.*cos(x)+177.*(sin(x).^2) - 108*(sin(x).^4)-72.*(cos(x).^3 .* sin(x).^2) -65;
% Γράφημα της f
x = linspace(0, 3, 10000);  
plot(x, f_x(x));
grid on; 
xlabel('x');      
ylabel('f(x)'); 
title('Plot of f(x)'); 



%Τροποποιημένη μέθοδος Newton-Raphson | 100 φορές επανάληψη με τυχαία
%αρχικοποίηση για ευρεση μέσου όρου
syms x  
f_x = 94.*(cos(x).^3) - 24.*cos(x)+177.*(sin(x).^2) - 108*(sin(x).^4)-72.*(cos(x).^3 .* sin(x).^2) -65; 
df = diff(f_x, x); 


a=0;
b=3;

TotalIterations = 0;

for i=0:100
    randomInitialization = a + (b-a) * rand;
    tolerance = 10^(-7);
    f_numeric = matlabFunction(f_x);
    df_numeric = matlabFunction(df);
    
    xn_1 =randomInitialization;
    xn =  xn_1 - f_numeric(xn_1) / df_numeric(xn_1) - (1./2)*f_numeric(xn_1).^2 * df_numeric(df_numeric(xn_1)) ./df_numeric(xn_1).^3;
    iterations = 1;
    while abs(xn - xn_1) > tolerance
        xn_1 = xn;
        xn =  xn_1 - (f_numeric(xn_1) ) / (df_numeric(xn_1)+eps) - (1./2)*(f_numeric(xn_1)).^2 * (df_numeric(eps+df_numeric(xn_1))) ./(df_numeric(xn_1)+eps).^3;
         iterations = iterations +1;
    end
    disp(xn);
    disp(iterations);
    TotalIterations = TotalIterations + iterations;
end
AverateIterations = TotalIterations / 100;
fprintf("Average: %.2f",AverateIterations);



  %Solutions that i should find
%2.003
%0.8410
%1.047



%0.8 5 gia itin 0.84
%2.5 5 gia tin 2.3005
%1.1.05 15 gia tin 1.047
%0.5132