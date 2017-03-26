function S = GaussSmoothing(I, N, sigma)

% Create a Gaussian mask and then use the standard filter function

Gmask = fspecial('gaussian', [N,N], sigma);
S = imfilter(I, Gmask, 'replicate');

end