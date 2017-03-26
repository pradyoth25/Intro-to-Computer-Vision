% Here we extract local maxima by performing a grey scale morphological
% dilation and then finding points in the corner strength image that
% match the dilated image and are also greater than the threshold.
function [r,c, rsubp, csubp] = surrounding_pixel_suppress(cim, radius, thresh)

   
    [rows,cols] = size(cim);
           
    % Size of dilation mask.
    sze = 2*radius+1;
    % Grey-scale dilate.
    mx = ordfilt2(cim,sze^2,ones(sze)); 

    % Make mask to exclude points within radius of the image boundary. 
    bordermask = zeros(size(cim));
    bordermask(radius+1:end-radius, radius+1:end-radius) = 1;
    
    % Find maxima, threshold, and apply bordermask
    cimmx = (cim==mx) & (cim>thresh) & bordermask;
    
    % Find row,col coords.
    
    [r,c] = find(cimmx);                