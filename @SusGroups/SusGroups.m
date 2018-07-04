%> @file SusGroups.m
%> @brief File used to deal with semi-orthogonal user selection groups
% ======================================================================
%> @brief TODO
%
%> TODO
% ======================================================================
classdef SusGroups
    properties
        %> Set of stations in the SUS group
        stasSet;
        %> Tree of stations 
        staTree;
    end
    methods
        % ======================================================================
        %> @brief Class constructor
        %>
        %> More detailed description of what the constructor does.
        %>
        %> @param param1 Description of first parameter
        %> @param anotherParam Description of the second parametere
        %>
        %> @return instance of the Template class.
        % ======================================================================
        function obj = SusGroups(root, stas)
            obj.stasSet = stas;
            obj.staTree = tree(root);
        end
        % ======================================================================
        %> @brief Brief description of the exampleMethod1 method
        %>
        %> @param obj instance of the Template class.
        %>
        %> @return instance of the Template class.
        % ======================================================================
        %function obj = test(obj, tmp)
        %    obj.tmp = tmp;
        %end
    end
end
%hist(atan(imag(h)./real(h)),20)
