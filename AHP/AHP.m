function [ Weight,CR,CI,RI ] = AHP( Matrix )
% Consistency Check in Judgement Matrix
%
% NOTE: The Judgement Matrix Must Be A SQUARE MATRIX of order N
%       And N cannot larger than 11
%
% 2015-1-6 : Completed

    n = length(Matrix);
    Ri = [0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];
    RI = Ri(n);
    [ x,y ] = eig(Matrix);              %������������x��������y
    lambda = max(diag(y));              %���������lambda
    CI = (lambda - n)/(n - 1);
    num = find( diag(y)==lambda );
    Weight = x(:,num)./sum(x(:,num));   %Ȩ������
    CR = CI/RI;
    if CR<0.1
        disp('Acceptable!');
    else
        disp('Unacceptable!');
    end;
end

