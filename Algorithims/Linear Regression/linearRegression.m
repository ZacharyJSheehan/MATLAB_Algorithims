function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
[sortedY,sortOrder] = sort(y)
sortedX= x(sortOrder)
[m,n]=size(y)
[mx,nx]=size(x)
if nx ~=n
    error('this is an improper size func')
end
firstQ=(n+1)/4
thirdQ= (3*n + 3)/4
IQR= thirdQ-firstQ
bigOutlier = thirdQ+ 1.5*IQR
smallOutlier = firstQ- 1.5*IQR
test=0
sure=n+1
while test<n
    sure= sure-1
    hmmm=sortedY(1,sure)
    if hmmm > bigOutlier
        sortedY = sortedY(find(sortedY~=hmmm))
        hmmm=sortedX(1,sure)
        sortedX = sortedX(find(sortedX~=hmmm))
    end
    test=test+1
end
[m,n]=size(sortedY)
test=0
sure=0
while test<n
    sure=sure+1
    hmmm=sortedY(1,sure)
    if hmmm < smallOutlier
        sortedY = sortedY(find(sortedY~=hmmm))
        hmmm=sortedX(1,sure)
        sortedX = sortedX(find(sortedX~=hmmm))
        sure=sure-1
    end
    test=test+1
end
fx=sortedX
fy=sortedY
slope=(n.*sum(sortedY.*sortedX)-sum(sortedX)*sum(sortedY))/(n.*(sum(sortedX.^2))-(sum(sortedX)).^2)
meanY=mean(sortedY)
meanX=mean(sortedX)
intercept= meanY-slope*meanX
SR= sum((fy-intercept-slope*fx).^2)
ST=sum((fy-meanY).^2)
Rsquared=(ST-SR)/ST
fX=sortedX
fY=sortedY

        
    
    


