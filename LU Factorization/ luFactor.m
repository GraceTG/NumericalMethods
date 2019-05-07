%% Mech 105 - LU Decomposition
%% Grace Taylorgoodall 

function [L,U,P] = luFactor(A)
%LU Decomposition with Partial Pivoting 
% input:
% A = coefficient matrix 
% output:
% L = lower triangular matrix 
% U = upper triangular matrix
% P = pivot matrix


P = eye(size(A)); % Pivot matrix 
L = P; % initially the lower triangular matrix and the pivot matrix are equal
U = A; % likewise, the upper triangular matrix and A matrix are initially equal 
j = size(A); % the number of columns and rows in A matrix 

[r,c] = size(A);

if r ~= c 
    error('A must be a square matrix')
end 
% above ensures that A matrix is a square and can be solved 

for i = 1:j
    [p, m] = max(abs(A(i:j,i))); % finds the largest absulute value element in the first column 
    m = m +(i-1); % ensures that for future iterations the proper element is used for calculations
    if m ~= i 
        x = U(i,:); 
        U(i,:) = U(m,:); % assigns rows for upper triangular matrix 
        U(m,:) = x;
        x = P(i,:); 
        P(i,:) = P(m,:); % assigns values for pivot matrix
        P(m,:) = x; 
        if i >= 2
            l_1 = L(i,1:i-1); % assigns values to lower triangular matrix 
            l_2 = L(m,1:i-1);
            x = l_1;
            l_1 = l_2;
            l_2 = x;
        end 
    end 
    for k = i+1:j
        L(k,i) = U(i,k)/U(i,i); % assigns values of lower triangular matrix based on elements from A(or U since they are set equal to each other) which were used in elimination
        U(k,:) = U(k,:)-L(k,i)*U(k,:); % assigns the missing values of the upper triangular matrix 
    end 
   
end
  A = L*U




