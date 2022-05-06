function [I] = Simpson(x, y)
[Mx,Nx]=size(x)
[My,Ny]=size(y)
if Nx ~= Ny
    error('there is not an assigned Y value for every X value')
end
check=linspace(x(1,1),(x(1,Nx)),Nx)
checked=check-x
zeroes= zeros(1,Ny)
if checked == zeroes
b=x(1,Nx)
a=x(1,1)
i=(2:2:Nx-1)
j=(3:2:Nx-1)
[Mi,Ni]=size(i)
[Mj,Nj]=size(j)
changex=((b-a)/Ny)
if (i(1,Ni)+2)<Nx
    trap=((y(1,Ny)+y(1,Ny-1))/2)*(x(1,2)-x(1,1))
else 
    trap=0
end

fill=1
simp=y(1,1)+y(1,Ny)
while Ni>=fill && Nj>=fill
 k=4.*y(1,i(1,fill))
 l=2.*y(1,j(1,fill))
 simps=k+l
 simp=simp+simps
 fill=fill+1
end 
I=(simp+trap)*(changex/3)

if Nx == 2
    I= ((y(1,1)+y(1,2))/2)*(x(1,2)-x(1,1))
elseif Nx==3
    I= (changex/3)*(y(1,1)+(4*y(1,2))+ y(1,3))
end
else
    error('the X matrix is not evenly spaced')
end


end
