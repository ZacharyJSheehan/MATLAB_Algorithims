function [A] = specialMatrix(n,m)
% This function should return a matrix A as described in the problem statement
% Inputs n is the number of rows, and m the number of columns
% It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
if nargin ~= 2
    error('bechara does not approve, most have 2, and only 2 inputs')
end
A= zeros (n,m)
i=1:n
j=1:m
A(:,1)=i
A(1,:)=j

for k = 2:(n)
    for l = 2:(m)
        A(k,l)= A(k-1,l)+A(k,l-1)
    end

        
        
end



% Now the real challenge is to fill in the correct values of A


end