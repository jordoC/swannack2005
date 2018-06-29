%Example for generating 2-D Poisson point process
%   
%   Conceptual Notes:
%      -See inline 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ppp_pairs = ppp_2d(lambda, length, file_path)
    %disp 'WARNING: Overwriting function arguments in ppp_2d'
    %lambda_linear = 1;
    %samps_linear = 100;
    %file_path = 'ppp_pairs.csv';
    
    X = poissrnd(sqrt(lambda),length,length);
    Y = poissrnd(sqrt(lambda),length,length);
    
    %Form the product of the independent poisson RV's to get the number of points
    %in a unit step size
    R = Y.*transp(X);
    points = sum(sum(R));
    A = length^2;
    density = points/A
    
    
    %Generate a set of grid pairs based on the probabilities previously calculated.
    %   -Cartesian pairs are independently generated uniformly: the number of
    %    points generated in a given cell is given by the PPP statistics generated
    %    above.
    %   -The output is a vector of cartesian pairs
    grid_pairs =zeros(points,2);
    grid_idx = 1;
    for y_dim = 1:length
        for x_dim = 1:length
            for pt_num = 1:R(x_dim,y_dim)
                R(x_dim,y_dim);
                x = rand(1)+x_dim-1;
                y = rand(1)+y_dim-1;
                grid_pairs(grid_idx,:) = [x y];
                grid_idx = grid_idx + 1;
            end 
        end
    end 
    csvwrite(file_path, grid_pairs);
    ppp_pairs = grid_pairs;
    %scatter(grid_pairs(:,1), grid_pairs(:,2));
end
