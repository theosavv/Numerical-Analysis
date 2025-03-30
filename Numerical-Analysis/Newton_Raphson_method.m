% H συνάρτηση f
format long;
f_x = @(x) exp(sin(x).^3) + x.^6 - 2*x.^4 - x.^3 - 1;

% Γράφημα της f
x = linspace(-2, 2, 10000);  
plot(x, f_x(x));
grid on; 
xlabel('x');      
ylabel('f(x)'); 
title('Plot of f(x)'); 



%Μέθοδος Newton-Raphson | 100 φορές για εύρεση μέσου όρου
syms x  
f_x = exp(sin(x)^3) + x^6 - 2*x^4 - x^3 - 1; 
df = diff(f_x, x); 
disp(df);
tolerance = 10^(-7);
f_numeric = matlabFunction(f_x);
df_numeric = matlabFunction(df);

a=-2;
b=2;

TotalIterations = 0;
for i=0:100
    randomInitialization = a + (b-a) * rand;

    iterations = 1;

    xn_1 = randomInitialization;
    xn =  xn_1 - f_numeric(xn_1) ./ (df_numeric(xn_1)+eps);
    while abs(xn - xn_1) > tolerance
        if f_numeric(xn)<10^(-1)
            iterationsAfterOnePersisionDigit = iterationsAfterOnePersisionDigit+1;
        end
         iterations = iterations +1;
         xn_1 = xn;
         xn =  xn_1 - f_numeric(xn_1) / (df_numeric(xn_1)+eps);
    
    end
    TotalIterations = TotalIterations+ iterations;
    fprintf('root: %.7f\n', xn );
    fprintf("iterations: %d\n",iterations);
    fprintf("Initialization: %.2f\n\n",randomInitialization);
end
disp(TotalIterations);
AverateIterations = TotalIterations ./100;
fprintf("Average iterations: %.2f",AverateIterations);





