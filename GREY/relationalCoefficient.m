function [ Xi ] = relationalCoefficient( referenceSequence,...
    comparedSequence,Rho )
% Compute Grey Relational Coefficients
%   XI  matrix of Grey Relational Coefficients
%   REFERENCESEQUENCE is a row feature vector
%   COMPAREDSEQUENCE is a [feature]*[num] matrix
%   RHO the distinguishing coefficient
%
%   NOTE:
%       All Sequences Must be NORMALIZED
%
%   2015-2-2 Completed
    if nargin == 2
        Rho = 0.5; 
    end;
    [ n,m ] = size(comparedSequence);
    Xi = zeros(n,m);
    t = zeros(n,m);
    for j = 1:n
        t(j,:) = comparedSequence(j,:) - referenceSequence;
    end;
    t = abs(t);
    minmin = min(min(t'));
    maxmax = max(max(t'));
    Xi = (minmin + Rho*maxmax) ./ (t + Rho*maxmax);
end

