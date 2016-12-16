function [Q_res, R_res] = QR(A)
    [m,n]=size(A);
    Q = zeros(m,n);
    R = zeros(m,n);
    for i = 1:n
        for k = i:n
            if (i == 1)
                break;
            end
            R(i-1,k) = transpose(Q(:,i-1)) * A(:,k);
            A(:,k) = A(:,k) - transpose(Q(:,i-1)) * A(:,k) * Q(:,i-1);
        end
        if (A(:,i) ~= zeros(m,1))
            if (i<=m)
                R(i,i) = sqrt(dot(A(:,i),A(:,i)));
            end
            Q(:,i) = Normalize(A(:,i));
        end
    end
    Q_res = Q;
    R_res = R;
end

function [normal_vec] = Normalize(x)
    normal_vec = x/sqrt(dot(x,x));
end


