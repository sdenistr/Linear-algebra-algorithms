function [A_res] = RegularGS(A)
    [m,n]=size(A);
    U = zeros(m,n);
    for i = 1:n
        kiluf = zeros(m,1);
        for j = 1:(i-1)
            kiluf = kiluf + transpose(U(:,j))* A(:,i) * U(:,j);
        end
        U(:,i) = A(:,i) - kiluf;
        if (U(:,i) ~= zeros(m,1))
            U(:,i) = Normalize(U(:,i));
        end
    end
    A_res = U;
end

function [normal_vec] = Normalize(x)
    normal_vec = x/sqrt(dot(x,x));
end