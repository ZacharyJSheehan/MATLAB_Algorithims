function [L, U, P] = luFactor(A)
A = [10, 2, -1; 
    -3, -6, 2;
    1, 1, 5];;
b = [27; -61.5; -21.5];
a=A
[M,N]=size(A)
P=zeros(M)
if M~=N
    error('Matrix must be a square')
end
Ltemplate=ones(1,N)
L=diag(Ltemplate)
pivoting= A(:,[1])
col=1;
y=0;
z=1;
reps=1;
R=1;
RestofRows=1;
row=0;
Lrow=2;
Lcol=1;
eLrow=2;
while M>col
    z=z+1;
    y=y+1;
    ROWold=y;
    ROWnew=z;
    row=row+1;
    A(ROWold,col);
    RestofRows=RestofRows+1;
    while M>row
        %old=A(ROWold,1)
        %new=A(ROWnew,1)
        %if old > new
        if abs(A(ROWold,col))>abs(A(ROWnew,col));
            ROWnew=ROWnew+1;
            row=row+1;
        else
            d=ROWnew;
            ROWnew=ROWnew+1;
            ROWold=d;
            row=row+1;
        end
    end
    d=A(ROWold,:)
    K=A(R,:)
    A(R,:)=d
    A(ROWold,:)=K
    P(R,col)=1
    %Pivoting position has been determined, commence Gauss elimination
    repz=reps
    RoR=RestofRows
    while reps < M
    factor=A(RestofRows,col)/A(R,col)
    GaussONE= A(R,:)*factor
    GaussTWO= GaussONE-A(RestofRows,:)
    d=RestofRows
    A(RestofRows,:)=GaussTWO
    d=d+1
    RestofRows=d
    reps=reps+1
    L(Lrow,Lcol)=factor %building L Matrix
    Lrow=Lrow+1
    end
    col=col+1;
    R=R+1;
    reps=repz+1;
    RestofRows=RoR;
    eLrow=eLrow+1;
    Lrow=eLrow;
    Lcol=Lcol+1;
end
quickfix=2:2:M
A(quickfix,:)=A(quickfix,:).*-1
U=A
n=N-1
errorcheck=zeros(1,n)
sums=sum(P,1)
pnw=1
while sums(1,pnw)~=0
    pnw=pnw+1
end
P(N,pnw)=1
if U(M,1:n)~= errorcheck
    error('the entered matrix cannot be computed with LU decomposition')
end
[L,U,P]=lu(a)




        
    
    
    
            
    