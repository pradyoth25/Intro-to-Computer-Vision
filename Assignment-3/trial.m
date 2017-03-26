img = rgb2gray(imread('D:\Course work\Fall 2016\Intro to Computer Vision\Assignment 3\moon.bmp', 'bmp'));
figure;
imshow(img);
title('Input Image');
% showing the input image
figure;
imhist(img);
title('Histogram of Input Image');
% showing the histogram of the input image
[img_out] = hiss(img);
figure;
imshow(img_out);
title('Output Image');
%showing the output image
figure;
imhist(img_out);
title('Histogram after normalization');
% histogram of image after normalization
img_light = regg(img_out);
figure; img1 = mat2gray(img_light);
imshow(img1);
title('Image after lighting correction');
% Image after lighting correction
% The transfer function is plotted inside the function "hiss.m"