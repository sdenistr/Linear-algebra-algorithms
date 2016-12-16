function [A_res] = StableGS(A)
    [m,n]=size(A);
    U = zeros(m,n);
    for i = 1:n
        for k = i:n
            if (i == 1)
                break;
            end
            A(:,k) = A(:,k) - transpose(U(:,i-1)) * A(:,k) * U(:,i-1);
        end
        if (A(:,i) ~= zeros(m,1))
            U(:,i) = Normalize(A(:,i));
        end
    end
    A_res = U;
end

function [normal_vec] = Normalize(x)
    normal_vec = x/sqrt(dot(x,x));
end