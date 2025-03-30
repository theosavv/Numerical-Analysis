%My initial code

% % PA = LU
% 
% rows = input('Enter the number of rows: ');
% cols = input('Enter the number of columns: ');
% if rows==cols
% 
%     A = zeros(rows, cols);
%     I = zeros(rows, cols);
%     for i = 1:rows
%     I(i, i) = 1; 
%     end
%     P=I;
% 
% 
%     disp('Enter matrix elements row by row:');
%     for i = 1:rows
%         for j = 1:cols
%             A(i, j) = input(sprintf('Element (%d, %d): ', i, j));
%         end
%     end
%     U = A;
%     L = zeros(rows, cols);
%     for j = 1:cols-1
%         i = j;
%         [max_value, row_index] = max(abs(U(i:rows, j)));
%         row_index = row_index + j - 1; % **[Fixed]** Adjust row_index to reflect the actual row in the matrix
%         U([i, row_index], :) = U([row_index, i], :);
%         P([i, row_index], :)= P([row_index, i],:);
%         L([i, row_index], :) = L([row_index, i], :);  % Swap rows in L as well
% 
%         for i=j+1:rows
%             coefficient = U(i,j)/U(j,j);
%             L(i,j) = coefficient;
% 
%             for col = 1:cols
%                  U(i, col) = U(i, col) - coefficient * U(j, col);
%             end
%         end
%     end
% 
% 
% 
% 
%     disp('The entered matrix is: ');
%     disp(A);
%      disp('The U is: ');
%     disp(U);
%     disp('The L is: ');
%     disp(L);
%     disp('The P is: ');
%     disp(P);
% 
% else
%     disp("The Matrix should be square.")
% end


%Code after ChatGPT's changes
rows = input('Enter the number of rows: ');
cols = input('Enter the number of columns: ');

if rows == cols
    % Initialize matrices
    A = zeros(rows, cols);
    I = eye(rows); % Identity matrix
    P = I;         % Permutation matrix starts as identity
    L = eye(rows); % L starts as the identity matrix

    % Input matrix
    disp('Enter matrix elements row by row:');
    for i = 1:rows
        for j = 1:cols
            A(i, j) = input(sprintf('Element (%d, %d): ', i, j));
        end
    end
    U = A; % This will be transformed into U

    % LU Decomposition with Partial Pivoting
    for j = 1:cols-1
        % Partial pivoting: find row with max value in column
        [~, row_index] = max(abs(U(j:rows, j)));
        row_index = row_index + j - 1;

        % Row swapping for P, Matrix (U), and L
        if row_index ~= j
            % Swap rows in Matrix (U)
            U([j, row_index], :) = U([row_index, j], :);

            % Swap rows in P
            P([j, row_index], :) = P([row_index, j], :);

            % Swap rows in L below the pivot column only
            if j > 1
                L([j, row_index], 1:j-1) = L([row_index, j], 1:j-1);
            end
        end

        % Elimination to form U and update L
        for i = j+1:rows
            coefficient = U(i, j) / U(j, j);
            L(i, j) = coefficient;

            % Update the row in Matrix
            U(i, j:cols) = U(i, j:cols) - coefficient * U(j, j:cols);
        end
    end

    % Display results
    disp('The entered matrix is: ');
    disp(A);
    disp('The U is: ');
    disp(U);
    disp('The L is: ');
    disp(L);
    disp('The P is: ');
    disp(P);

else
    disp("The Matrix should be square.");
end

b = zeros(rows, 1);
for i = 1:rows
    b(i) = input(sprintf('Enter b%d: ', i));
end

b_transformed = P * b;

y = L \ b_transformed;

x = U \ y;

disp('The solution x is:');
disp(x);








