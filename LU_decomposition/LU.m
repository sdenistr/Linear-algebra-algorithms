function [L,U] = LU(A)

[m,n] = size(A);
L = eye(m,m);
U = zeros(m,n);
tol = sqrt(eps);

for k = 1:min(m,n)
    if abs(A(k,k)) >= tol
        for i = k+1:m
            L(i,k) = A(i,k)/A(k,k);
            for j = k+1:n
                A(i,j) = A(i,j)-L(i,k)*A(k,j);
            end
        end
    end
    for j = k:n
        U(k,j) = A(k,j)*(abs(A(k,j)) >= tol);
    end
end