% we need to determine which weak edges are actual edges. 
% To do this, we perform an edge tracking algorithm. 
% Weak edges that are connected to strong edges will be actual/real edges. 
% Weak edges that are not connected to strong edges will be removed. 

function E = EdgeLinking(Mag_low, Mag_high, Mag)

[h,w] = size(Mag);
highThreshold = Mag_high;
lowThreshold = Mag_low;

strongEdgesRow = zeros(1,h*w); % Keep track of the strong edge row index
strongEdgesCol = zeros(1,h*w); % Keep track of the strong edge col index
weakEdgesRow = zeros(1,h*w); % Keep track of the weak edge row index
weakEdgesCol = zeros(1,h*w); % Keep track of the weak edge col index
strongIndex = 1;
weakIndex = 1;

% Iterate over rows and cols
for i=2:h-1 
for j=2:w-1 
    
if Mag(i,j) > highThreshold % Strong edge
Mag(i,j) = 1;
strongEdgesRow(strongIndex) = i;
strongEdgesCol(strongIndex) = j;
strongIndex = strongIndex + 1;

elseif Mag(i,j) < lowThreshold % No edge
Mag(i,j) = 0;

else % Weak edge
weakEdgesRow(weakIndex) = i;
weakEdgesCol(weakIndex) = j;
weakIndex = weakIndex + 1;
end
end
end
% Perform edge tracking by hysteresis
set(0,'RecursionLimit',10000)

for i=1:strongIndex-1
% Find the weak edges that are connected to strong edges and set
% them to 1
Mag = FindConnectedWeakEdges(Mag, strongEdgesRow(i),strongEdgesCol(i));
end
% Remove the remaining weak edges that are not actually edges
% and is noise instead
for i=1:weakIndex-1
if Mag(weakEdgesRow(i),weakEdgesCol(i)) ~= 1
Mag(weakEdgesRow(i),weakEdgesCol(i)) = 0;
end
end
E = Mag;
end

% Find weak edges that are connected to strong edges and set them to 1
function[Mag] = FindConnectedWeakEdges(Mag, row, col)
for i = -3:1:3
for j = -3:1:3
if (row+i > 0) && (col+j > 0) && (row+i < size(Mag,1)) && ...
(col+j < size(Mag,2)) % Make sure we are not out of bounds
if (Mag(row+i,col+j) > 0) && (Mag(row+i,col+j) < 1)
Mag(row+i,col+j) = 1;
Mag = FindConnectedWeakEdges(Mag, row+i, col+j);
end
end
end
end
end