% MP#1 Connected Component Labeling, Pradyoth Hegde, User Id: 2997017
%This is the main file, run this program and make sure the file "ccl1.m" is
%present in the same folder, along with the image files

%this line reads the input image
im = imread('C:\Users\Pradyoth Hegde\Downloads\attachments11\test.bmp');
%uncomment the next line to use size filter for gun.bmp
% im = bwareaopen(im,230);

%this line calls the ccl function which was implemented
[label_img,num] = ccl1(im);


%this line shows the number of distinct labels
num
figure;

%this line converts from labels to a grayscale image
im2 = mat2gray(label_img);
%this line displays the output
imshow(im2);

