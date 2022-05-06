function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method

f_xl=func(xl);
f_xu=func(xu);
rootcheck= f_xu*f_xl;
xr_i=xu-(f_xu*(xl-xu)/(f_xl-f_xu));
iter=0;
ea = abs((xr_i - xl)/xr_i)*100;
initial_lower = f_xl;
if nargin ==3
    es=0.0001
    maxit=200;
end
if rootcheck <0
    if initial_lower >0 %the lower bound is the positive value, and the upper bound is the negative
        while es <= ea || maxit > iter
            xr=xr_i;
            iter= iter+1;
            f_xr=func(xr);        
            if f_xr <0 %the root guess is the new negative value, so it replaces the upper bound
                f_xl=func(xl);
                xr_i= xr-(f_xr*(xr-xl)/(f_xr-f_xl))
                ea = abs((xr_i - xr)/xr_i)*100
            else % the root guess is the new positive value, so it replaces the lower bound
                f_xu = func(xu);
                xr_i=xu-(f_xu*(xu-xr)/(f_xu-f_xr))
                ea = abs((xr_i - xr)/xr_i)*100;
                
            end
            f_xr_i = func(xr_i);
            if f_xr_i>0 %the new-new guess is the positive value
                xl= xr_i;
            else
                xu=xr_i;
            end

        end
    end
    
    else %upper bound is the positive, and lower bound is the negative.
        while ea > es | maxit>iter
            
            iter=iter+1
            xr=xr_i
            f_xr=func(xr)
        if f_xr >0 %the root guess is the new positive value, so it replaces the upper bound
                f_xl=func(xl);
                xr_i= xr-(f_xr*(xr-xl)/(f_xr-f_xl))
                ea = abs((xr_i - xr)/xr_i)*100;
        else % the root guess is the new negative value, so it replaces the lower bound
                f_xu = func(xu);
                xr_i=xu-(f_xu*(xu-xr)/(f_xu-f_xr))
                ea = abs((xr_i - xr)/xr_i)*100;
                
            end
            f_xr_i = func(xr_i);
            if f_xr_i>0 %the new-new guess is the positive value
                xu= xr_i;
            else
                xl=xr_i;
            end
        end
end

root= xr_i
fx = func(xr_i)
