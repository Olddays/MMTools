function [ R ] = relationalDegree( Xi )
%RELATIONALDEGREE Compute RelationalDegree 
%   XI  the matrix returned by relationalCoefficient.m
%   R a col vector of relational degrees
%
%   2015-2-2 Completed
    R = sum(Xi')/size(Xi,2);
    R = R';
end

