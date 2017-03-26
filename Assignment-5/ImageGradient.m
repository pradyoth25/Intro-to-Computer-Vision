function [Mag, Theta, Gx, Gy] = ImageGradient(S)

% Function to get the Magnitude in X, Y Directions
% Also to get the Magnitude and the Angle

[Gx, Gy] = imgradientxy(S);
[Mag, Theta] = imgradient(Gx, Gy);

end
