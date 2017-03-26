% Suppose you represent the lines in the form of matrices
% [X][phi] = [Y]
% [X] = [1 x1 y1; 1 x2 y2; ...] this matrix contains the x and y values
% [phi] = [a; b; c] this matrix contains the co-efficients
% [Y] = [i1; i2; i3; ....] this is the intensity values of each pixel
% the [phi] can be calulcated using the function inv(X'*X)*X'*Y
% the co-efficients in phi are used to caluclat the new pixel values and
% the output image is displayed

function [img_out] = regg(img_in)
si1 = size(img_in);
x = zeros(si1(1)*si1(2),1);
y = zeros(si1(1)*si1(2),1);
z = zeros(si1(1)*si1(2),1);

for i = 1: size(img_in,1)
   for j = 1: size(img_in,2)
      x(i*(size(img_in,2)-1)+j) = i;
      y(i*(size(img_in,2)-1)+j) = j;
      z(i*(size(img_in,2)-1)+j) = img_in(i,j);
   end
end

N = length(x);
X =[ones(N,1),x, y];
Y = z;
phi = inv(X'*X)*X'*Y;

img_out = img_in;
for i = 1:si1(1)
   for j= 1:si1(2)
      img_out(i,j) = img_in(i,j) - phi(2)*i - phi(3)*j - phi(1);
   end
end

end