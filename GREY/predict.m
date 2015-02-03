function [ result ] = predict( x,num,Alpha )
%PREDICTION Use GM(1,1) to predict next NUM numbers
%   Alpha 
%
%   2015-2-3 Completed
    if nargin == 2
        Alpha = 0.5;
    end;
    rawLength = length(x);
    
    lb = exp(-2/(rawLength+1));
    ub = exp(2/(rawLength+2));
    lambda = x(1:rawLength-1)./x(2:rawLength);
    range = minmax(lambda);
    if (range(1)<lb)||(range(2)>ub)
        disp 'Please Shift By xi = xi + Constant'
        return;
    end;
    
    x1 = cumsum(x);
    z1 = zeros(size(x1));
    for i = 2:rawLength
        z1(i) = Alpha*x1(i) + (1-Alpha)*x1(i-1);
    end;
    Y = x(2:end)';
    B = -z1(2:end)';
    B = [ B ones(size(B)) ];
    U = pinv(B'*B)*B'*Y;
    a = U(1);
    b = U(2);
    xPred1 = zeros(1,rawLength + num);
    for i = 1 : rawLength+num-1
        xPred1(i+1) = (x(1) - b/a)*exp(-a*i) + b/a;
    end;
    xPred1(1) = x(1);
    xPred = [ x(1) diff(xPred1) ];
    result = xPred(end-num+1:end);
    
%     disp(x)
%      disp(xPred)
    
    epsilon = x - xPred(1:rawLength);
    delta = abs(epsilon./x);
    rho = 1-(1-0.5*a)./(1+0.5*a).*lambda;
    g = max([max(delta),max(rho)]);
    if g < 0.1
        disp 'Great!'
    elseif g < 0.2
        disp 'Good!'
    else
        disp 'Opps...YOU CANT BELIEVE THIS RESULT!!'
    end;
end