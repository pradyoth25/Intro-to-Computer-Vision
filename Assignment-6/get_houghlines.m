% This function takes an image and its Hough transform and finds the
% significant lines in the image and then plots them over the image
% im is the original image
% h is the hough transform
% thresh is the threshold level to use in the hough transform to decide
% whether the edge is significant or not
function  get_houghlines(im, h, thresh)

    [rows, cols] = size(im);  
    [nrho, ntheta] = size(h);
    
    rhomax = sqrt(rows^2 + cols^2);
    drho =  2*rhomax/(nrho-1);         
    
    % The increment in theta between entries.
    dtheta = pi/ntheta;
    % Array of theta values across the accumulator matrix.
    theta = [0:dtheta:(pi-dtheta)];    
    
    [rhoindex,thetaindex] = surrounding_pixel_suppress(h, 7, thresh);

    rho = drho*(rhoindex' - nrho/2);
    theta = dtheta*(thetaindex' - 1);
    
    x = [0; cols]*ones(1, length(rhoindex));
    y = [rho./sin(theta); (rho - x(2,:).*cos(theta))./sin(theta)];
    
    hold on;
    figure;
    imshow(im);
    line(x, y,'Color','w');
    hold off;