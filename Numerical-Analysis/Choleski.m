%Choleski
dimention = input('Enter the dimention of the square symmetric, positive definite matrix A: ');
disp('Enter matrix elements row by row:');
A = zeros(dimention, dimention);
for i = 1:dimention
    for j = 1:dimention
        A(i, j) = input(sprintf('Element (%d, %d): ', i, j));
    end
end
L=zeros(dimention,dimention);
for i=1:dimention
   L(i, i) = sqrt(A(i, i) - L(i, :)*L(i, :)');
   for j=(i + 1):dimention
      L(j, i) = (A(j, i) - L(i,:)*L(j ,:)')/L(i, i);
   end
end
disp(L);