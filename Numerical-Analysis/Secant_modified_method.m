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

%Μέθοδος Τέμνουσας Μετασχηματισμένης | 100 επαναλήψεις για εύρεση μέσης ταχύτητας σύγκλισης
syms x  
f_x = 94.*(cos(x).^3) - 24.*cos(x)+177.*(sin(x).^2) - 108*(sin(x).^4)-72.*(cos(x).^3 .* sin(x).^2) -65; 
tolerance = 10^(-7);
f_numeric = matlabFunction(f_x);
MAX_ITERATIONS = 200;
a = 0;
b = 3;
TotalIterations = 0;
succesfulIterations =0;
while succesfulIterations<100
    randomInitialization1 = a + (b-a) * rand;
    randomInitialization2 = a + (b-a) * rand;
    randomInitialization3 = a + (b-a) * rand;
    
    xn = randomInitialization1;
    xn1 = randomInitialization2;
    xn2 = randomInitialization3;
    iterations = 1;
    q = f_numeric(xn)/f_numeric(xn1);
    r = f_numeric(xn2)/f_numeric(xn1);
    s = f_numeric(xn2)/f_numeric(xn);
    xn3 = xn2 - (( r.*(r-q).*(xn2-xn1) + (1-r).*s.*(xn2-xn) )/ (((q-1).*(r-1).*(s-1)+eps)));
    
    while abs(f_numeric(xn3)) > tolerance || abs(xn3 - xn2) > tolerance && abs(xn3 - xn1) > tolerance && abs(xn3 - xn) > tolerance
    
         xn=xn1;
         xn1=xn2;
         xn2=xn3;
         q = f_numeric(xn)/f_numeric(xn1);
         r = f_numeric(xn2)/f_numeric(xn1);
         s = f_numeric(xn2)/f_numeric(xn);
         xn3 = xn2 - (( r.*(r-q).*(xn2-xn1) + (1-r).*s.*(xn2-xn) )/ (((q-1).*(r-1).*(s-1)+eps)));
         iterations = iterations +1; 
         if iterations==200
             break;
         end
    end
    fprintf('%.7f', xn3);
    disp(iterations);
    if(iterations<200)
         TotalIterations = TotalIterations + iterations;
         succesfulIterations = succesfulIterations+1;
         disp(succesfulIterations);
    end
end

AverateIterations = TotalIterations/100;
disp(AverateIterations);