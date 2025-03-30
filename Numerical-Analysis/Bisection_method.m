% H συνάρτηση f
f_x = @(x) exp(sin(x).^3) + x.^6 - 2*x.^4 - x.^3 - 1;

% Γράφημα της f
x = linspace(-2, 2, 10000);  
plot(x, f_x(x));
grid on; 
xlabel('x');      
ylabel('f(x)'); 
title('Plot of f(x)'); 



%Μέθοδος διχοτόμησης

TotalIterations = 0;
tolerance = 10^(-7);
c1 = -1.4;
c2 = -0.8;
for i=1:50
    a = c1 ;
    b = c2 ;
    iterations = 0;
    if f_x(a) * f_x(b)<0
        while (b - a)/2 > tolerance
            solution = ( b + a) / 2;
            iterations = iterations + 1;
            if abs(f_x(solution)) <eps 
                break;
            elseif f_x(solution) * f_x(a) < 0 
                b = solution;
            else
                a = solution;
            end
        end
        fprintf("Initialization: a= %.2f ",c1);
        fprintf("b= %.2f",c2);

        disp(solution);
        disp(iterations);
        TotalIterations = TotalIterations + iterations;
        c1 = c1 + 0.003;
        c2 = c2 - 0.003;
    else
        disp("Bolzano invalid.")    
    end
end

tolerance = 10^(-7);
c1 = -1;
c2 = 2;
for i=1:40
    a = c1 ;
    b = c2 ;
    iterations = 0;
    if f_x(a) * f_x(b)<0
        while (b - a)/2 > tolerance
            solution = ( b + a) / 2;
            iterations = iterations + 1;
            if abs(f_x(solution)) <eps 
                break;
            elseif f_x(solution) * f_x(a) < 0 
                b = solution;
            else
                a = solution;
            end
        end
        fprintf("Initialization: a= %.2f ",c1);
        fprintf("b= %.2f",c2);

        disp(solution);
        disp(iterations);
        TotalIterations = TotalIterations + iterations;
        c1 = c1 + 0.003;
        c2 = c2 - 0.003;
    else
        disp("Bolzano invalid.")    
    end
end
% As for root 0 every time the iterations are 1, i add 10 to the average (i opt for adding 10)
AverateIterations = (TotalIterations + 10) / 100;
disp(AverateIterations);





