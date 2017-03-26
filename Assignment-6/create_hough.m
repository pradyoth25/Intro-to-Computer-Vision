% Here the function takes a edge image and then constructs a Hough
% transform by finding the lines in the image
% here, BW is the edge image
% nrho is the number of quantised levels of rho
% ntheta is the number of quantised levels of theta
function h = create_hough(BW, nrho, ntheta)
    [rows, cols] = size(BW);
    h = zeros(nrho, ntheta);
    % The maximum possible value of rho.
    rhomax = sqrt(rows^2 + cols^2);
    % The increment of rho between successive entries
    drho =  2*rhomax/(nrho-1);
    % The increment in theta between entries.
    dtheta = pi/ntheta;
    % Array of theta values across the accumulator matrix.
    theta = [0:dtheta:(pi-dtheta)];    
    
    
    for i = 1:rows
        for j = 1:cols
            % for each non-zero point 
            if BW(i, j)                         
                for thetaindex = 1:ntheta
                    rho = j*cos(theta(thetaindex)) + i*sin(theta(thetaindex));
                    rhoindex = round(rho/drho + nrho/2);
                    h(rhoindex, thetaindex) = h(rhoindex, thetaindex) + 1;
                end
            end
        end
    end