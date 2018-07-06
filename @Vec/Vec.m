%> @file Vec.m
%> @brief File used to implement shell vector class
% ======================================================================
%> @brief TODO
%
%> TODO
% ======================================================================
classdef Vec
    properties
        %> Shell class, to allow a vector of vectors to be done in matlab. 
        %> tries to avoid the issue of each row/col in a mtrix having to be
        %> the same lenth 
        val;
        length;
    end
    methods
        % ======================================================================
        %> @brief Class constructor
        %>
        %> More detailed description of what the constructor does.
        %>
        %> @param val values to initialze the vector with
        %>
        %> @return instance of the Vec class.
        % ======================================================================
        function obj = Vec(val)
            obj.val= val;
            obj.length = length(val);
        end
    end
end
