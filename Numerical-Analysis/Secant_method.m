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

syms x  
f_x = exp(sin(x)^3) + x^6 - 2*x^4 - x^3 - 1; 
tolerance = 10^(-7);
f_numeric = matlabFunction(f_x); 

    
%Μέθοδος Τέμνουσας | 100 επαναλήψεις για εύρεση μέσης ταχύτητας σύγκλισης


TotalIterations = 0;

a=-2;
b=2;

for i=0:100
    iterations =1;
    randomInitialization1 = a + (b-a) * rand;
    randomInitialization2 = a + (b-a) * rand;
    xn_1 = randomInitialization1;
    xn_2 = randomInitialization2;
    xn =  xn_1 - f_numeric(xn_1) *(xn_1 - xn_2) / (f_numeric(xn_1)-f_numeric(xn_2)+eps);    
    while abs(xn - xn_1)  > tolerance 
        iterations = iterations +1; 
        xn_2 = xn_1;
        xn_1 = xn; 
        xn =  xn_1 - f_numeric(xn_1) .*(xn_1 - xn_2) / (f_numeric(xn_1)-f_numeric(xn_2)+eps);
    end
    fprintf('%.7f', xn);
    disp(iterations);
    TotalIterations = TotalIterations + iterations;
end
AverateIterations = TotalIterations/100;
disp(AverateIterations);

