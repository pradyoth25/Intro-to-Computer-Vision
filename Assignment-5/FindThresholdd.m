function [Tlow, Thigh] = FindThresholdd(r_image)

% Get the Low and High Thresholds

% Initialize variables to calculate the CDF
Tlow = 0;
Thigh = 0;

f = zeros(256,1);
pdf = zeros(256,1);
cdf = zeros(256,1);
n = size(r_image,1)*size(r_image,2);

%Calculate the PDF
for i =1 : size(r_image,1)
for j = 1:size(r_image,2)
value = r_image(i,j);
f(value+1) = f(value+1)+1;
pdf(value+1) = f(value+1)/n;
end
end

sum = 0;
l = 255;

% Calculate the CDF
for i=1:size(pdf)
sum = sum + f(i);
cum(i) = sum;
cdf(i) = cum(i)/n;
end
co = 0;
% For 0.8 in the CDF, calculate the threshold till that point
% Thigh is that value and Tlow is half the value
for i =1:256
if cdf(i) <= 0.8042
co = co +1;
end
end
Thigh = co;


Tlow = floor(co/2);


end