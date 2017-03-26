mainMatrix = zeros(100,100);
img_in = imread('pointer1.bmp');
img_hsv = rgb2hsv(img_in);

im_H = img_hsv(:,:,1)*99;
im_H = fix(im_H);

im_S = img_hsv(:,:,2)*99;
im_S = fix(im_S);

sii = size(im_H);

% This is used to create a 2-D Histogram of the Training Data
for i=1:125
    % this is used to read files sequentially
img = imread(strcat(num2str(i),'.png'));
%converts RGB to HSV
hsv = rgb2hsv(img);
% Hue parameter
h_Image = hsv(:,:,1)*99;
% Saturation parameter
s_Image = hsv(:,:,2)*99;
% To convert to Integer
s_Image = fix(s_Image);
% To convert to Integer
h_Image = fix(h_Image);
si = size(h_Image);
% op is the binary output mask
op = zeros(sii);

% creates the H-S Histogram
for l = 1:si(1)
   for m = 1:si(2)
       mainMatrix(h_Image(l,m)+1,s_Image(l,m)+1) = mainMatrix(h_Image(l,m)+1, s_Image(l,m)+1)+1;
   end
end
end

% creates the Binary mask
for p =1: sii(1)
   for q = 1 :sii(2)
      if(mainMatrix(im_H(p,q)+1,im_S(p,q)+1) > 100)
         op(p,q) =  1;
      end
   end
end

% used to filter some noise
bwareaopen(op,500);


%to show output image
skin_img(:,:,1) = uint8(op) .* img_in(:,:,1) ;
skin_img(:,:,2) = uint8(op) .* img_in(:,:,2);
skin_img(:,:,3) = uint8(op) .* img_in(:,:,3) ;
figure;imshow(img_in);title('Input Image');
figure;imshow(skin_img);title('Skin Pixels only');
