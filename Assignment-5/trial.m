% This is a canny edge detector used to detect edges for different images
% Please note for best accuracy, different images need different Gaussian
% masks (N and sigma values)
% For best accuracy, the corresponding values are mentioned in the report
close all;
img = imread('lena.bmp');
im = rgb2gray(img);
imshow(im);title('Original Image');

% For Gaussian Smoothing
imgauss = GaussSmoothing(im, 3, 3);
figure; imshow(imgauss); title('After Gaussian Smoothing');

% For Image Gradient
[Mag, Theta] = ImageGradient(imgauss);
figure; imshow(mat2gray(Mag)); title('After Image Gradient');

% For Finding the Thresholds
r_image = uint8(255*mat2gray(Mag));
histo = imhist(r_image);
[T_low, T_high] = FindThresholdd(r_image);

% For Nonmaxima Supression
NM_Mag = NonmaximaS(imgauss);
figure; imshow(mat2gray(NM_Mag));title('After Nonmaxima Suppression');

% For Edge linking
E_im = EdgeLinking(T_low, T_high, NM_Mag);
figure; imshow((E_im)); title('Final Image after Edge Linking');

% Comparison with Standard Function
% Feel free to compare with whatever model
% For most images, we have compared with Sobel, but you can change it
E_mt = edge(im, 'sobel');
figure; imshow(E_mt);
title('Standard Function with Sobel');