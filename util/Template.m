%> @file Template.m
%> @brief File used to show an example of class description
% ======================================================================
%> @brief Here we have a brief description of the class.
%
%> And here we can put some more detailed informations about the class.
% ======================================================================
classdef Template
    properties
        %> Description of a property
        tmp;
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
        function obj = Template(tmp)
            obj.tmp= tmp;
        end
        % ======================================================================
        %> @brief Brief description of the exampleMethod1 method
        %>
        %> @param obj instance of the Template class.
        %>
        %> @return instance of the Template class.
        % ======================================================================
        function obj = test(obj, tmp)
            obj.tmp = tmp;
        end
    end
end
hist(atan(imag(h)./real(h)),20)
