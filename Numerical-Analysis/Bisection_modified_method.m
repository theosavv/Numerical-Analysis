% H συνάρτηση f
f_x = @(x) 94.*(cos(x).^3) - 24.*cos(x)+177.*(sin(x).^2) - 108*(sin(x).^4)-72.*(cos(x).^3 .* sin(x).^2) -65;
format long;
% Γράφημα της f
x = linspace(0, 3, 10000);  
plot(x, f_x(x));
grid on; 
xlabel('x');      
ylabel('f(x)'); 
title('Plot of f(x)'); 

%Solutions that i should find
%2.003
%0.8410
%1.047

syms x  
f_x = 94.*(cos(x).^3) - 24.*cos(x)+177.*(sin(x).^2) - 108*(sin(x).^4)-72.*(cos(x).^3 .* sin(x).^2) -65; 
f_numeric = matlabFunction(f_x);
tolerance = 10^(-7);


%Τροποποιημένη μέθοδος διχοτόμησης | 100 δοκιμές

TotalIterations=0;



c1 = 0.86;
c2 = 1.5;
for i=1:33
    a = c1;
    b =c2;
   
    iterations = 0;
    solution = a;
    if f_numeric(a) * f_numeric(b) <0
        while abs((b - a)) > tolerance || abs(f_numeric(solution)) > tolerance
           iterations = iterations + 1;
           if abs(f_numeric(a)) <= abs(f_numeric(b))
               solution = a + (1/3) *(b-a);
           else
               solution = b - (1/3)*(b-a);
           end
           if sign(f_numeric(solution)) == sign(f_numeric(a))
               a = solution;
           else
               b = solution;
           end
        end
        fprintf('%.7f' , solution);
        disp(iterations); 
        c1 = c1 + 0.005;
        c2 = c2 - 0.005;
        TotalIterations = TotalIterations + iterations;
    else
        disp("Bolzano invalid.");   
    end
end

c1 = 0.5;
c2 = 1.047;
for i=1:33
    a = c1;
    b =c2;
   
    iterations = 0;
    solution = a;
    if f_numeric(a) * f_numeric(b) <0
        while abs((b - a)) > tolerance || abs(f_numeric(solution)) > tolerance
           iterations = iterations + 1;
           if abs(f_numeric(a)) <= abs(f_numeric(b))
               solution = a + (1/3) *(b-a);
           else
               solution = b - (1/3)*(b-a);
           end
           if sign(f_numeric(solution)) == sign(f_numeric(a))
               a = solution;
           else
               b = solution;
           end
        end
        fprintf('%.7f' , solution);
        disp(iterations); 
        c1 = c1 + 0.005;
        c2 = c2 - 0.005;
        TotalIterations = TotalIterations + iterations;

    else
        disp("Bolzano invalid.");   
    end
end


c1 = 1.2;
c2 = 3;
for i=1:34
    a = c1;
    b =c2;
   
    iterations = 0;
    solution = a;
    if f_numeric(a) * f_numeric(b) <0
        while abs((b - a)) > tolerance || abs(f_numeric(solution)) > tolerance
           iterations = iterations + 1;
           if abs(f_numeric(a)) <= abs(f_numeric(b))
               solution = a + (1/3) *(b-a);
           else
               solution = b - (1/3)*(b-a);
           end
           if sign(f_numeric(solution)) == sign(f_numeric(a))
               a = solution;
           else
               b = solution;
           end
        end
        fprintf('%.7f' , solution);
        disp(iterations); 
        c1 = c1 + 0.005;
        c2 = c2 - 0.005;
        TotalIterations = TotalIterations + iterations;

    else
        disp("Bolzano invalid.");   
    end
end

AverageIterations = TotalIterations / 100;
disp(AverageIterations);

