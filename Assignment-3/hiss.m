function img_out = hiss(img_in)
r = size(img_in,1);
c = size(img_in,2);
img_out = uint8(zeros(r,c));
% creates the image out
n = r*c;
%creates the total number of pixels, no of rows X no of columns
f = zeros(256,1);
% frequency matrix
pdf = zeros(256,1);
% probability density matrix
cdf = zeros(256,1);
% cumulative density matrix
cum = zeros(256,1);
% cumulative sum matrix - which is the transfer function
out = zeros(256,1);
% another matrix to generate the output

for i=1:r
   for j=1:c
      value = img_in(i,j);
      f(value+1) = f(value+1)+1;
      pdf(value+1) = f(value+1)/n;
   end
end
%the function above first creates the frequency vector calculation and then
%calculates the pdf vector. 
sum = 0;
l = 255;

for i=1:size(pdf)
   sum = sum + f(i);
   cum(i) = sum;
   cdf(i) = cum(i)/n;
   out(i) = round(cdf(i)*l);
end
% this function calculates the cdf vector and the transfer function, along
% with the final output
figure;
plot(cdf);
title 'Transfer Function';
%the transfer function is plotted here
for i=1:r
   for j=1:c
      img_out(i,j) = out(img_in(i,j)+1); 
   end
end
% this function performs the new mapping
end