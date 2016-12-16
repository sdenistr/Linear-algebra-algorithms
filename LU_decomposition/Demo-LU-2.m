
%===========================
% LU factorization with finite precision
%===========================

A=3*randn(20);  
A(1,:)=1e-10*A(1,:); 
A(10,:)=1e-10*A(10,:); 
b=3*randn(20,1); 

[L,U,P]=lu(sparse(A),0);

figure(1); clf; 
subplot(2,2,1); imagesc(abs(L)); colorbar; axis image; 
subplot(2,2,2); imagesc(log(abs(L))); colorbar; axis image; 
subplot(2,2,3); imagesc(abs(U)); colorbar; axis image; 
subplot(2,2,4); imagesc(P); colorbar; axis image; 

x_lu1=inv(U)*(inv(L)*P*b); 

[L,U,P]=lu(sparse(A),1);

figure(2); clf; 
subplot(2,2,1); imagesc(abs(L)); colorbar; axis image; 
subplot(2,2,2); imagesc(log(abs(L))); colorbar; axis image; 
subplot(2,2,3); imagesc(abs(U)); colorbar; axis image; 
subplot(2,2,4); imagesc(P); colorbar; axis image; 

x_lu2=inv(U)*(inv(L)*P*b); 

figure(3); clf; 
plot(abs(x_lu1-A\b),'b');
hold on;
plot(abs(x_lu2-A\b),'r');
title('Absolute Difference between the Solutions');
legend({'No Permutation','With Permutation'}); 

figure(4); clf;
plot(abs(A*x_lu1-b),'b'); 
hold on;
plot(abs(A*x_lu2-b),'r');
title('Absolute Error |Ax-b| for the Two Solutions');
legend({'No Permutation','With Permutation'}); 



