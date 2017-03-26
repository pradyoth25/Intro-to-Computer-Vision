im = imread('D:\Course work\Fall 2016\Intro to Computer Vision\Assignment 2\gun.bmp');
figure;
imshow(im);
title('Input Image');
% The structuring element is se, feel free to change it to whatever value
% the user wants.
se = ones(3,3);

%call to the erosion function
img_out = Ero(im,se);

figure;
imshow(img_out);
title ('Erosion');
%call to the Dilation function
img_out2 = Dil(im,se);
figure;
imshow(img_out2);
title ('Dilation')
%call to the Opening function
img_out3 = Open(im,se);
figure;
imshow(img_out3);
title ('Opening');
%call to the Closing function
img_out4 = Close(im,se);
figure;
imshow(img_out4);
title ('Closing');
%call to the Boundary function
img_out5 = boundary(im,se);
figure;
imshow(img_out5);
title('Edge Detection');