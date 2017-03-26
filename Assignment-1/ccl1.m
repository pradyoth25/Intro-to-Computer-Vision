%This is the implemented ccl function. 
%This function takes in an input parameter "img" which is an image, and
%returns two values "label_img" and "num", where label_img is the labeled
%image and num is the number of distinct labels

function [label_img, num] = ccl1(img)
size1 = size(img);
l =0;
num=0;
conn=zeros(1,100);
disp(size(conn));
label_img = zeros(size1(1),size1(2));
% the implementation of the algorithm starts from here
for i=2:1:size1(1)-1
    for j=2:1:size1(2)-1
        if img(i,j) ~= 0
            %case 1
            if label_img(i,j-1)==0 && label_img(i-1,j) == 0
               l=l+1;
               conn(l) = l;
               label_img(i,j)=l;

            %case 2
            elseif label_img(i,j-1)~=0 && label_img(i-1,j) == 0
               label_img(i,j) = max(label_img(i-1,j),label_img(i,j-1)); 

            %case 3
            elseif label_img(i,j-1)==0 && label_img(i-1,j)~=0
                label_img(i,j) = max(label_img(i-1,j),label_img(i,j-1));

            %case 4
            elseif(label_img(i,j-1))~=0 && label_img(i-1,j)~=0 && label_img(i-1,j)==label_img(i,j-1)
                label_img(i,j) = label_img(i-1,j);
            %case 5
            else
                label_img(i,j) = min(label_img(i-1,j),label_img(i,j-1));
                
                conn(max(label_img(i-1,j),label_img(i,j-1))) = iter(conn,min(label_img(i-1,j),label_img(i,j-1)));

            %implemented if there are any irregularities in mapping. It
            %checks if there is a problem in creating the lookup table when
            %two values which are diagonal to each other don't match one
            %another
            end
            if label_img(i+1,j) ~= label_img(i,j+1)
                conn(max(label_img(i+1,j),label_img(i,j+1))) = iter(conn,min(label_img(i+1,j),label_img(i,j+1)));
        end
    end

end

si = size(label_img);

%this is used for labelling the label image

for i=1:1:si(1)
    for j=1:1:si(2)
        if(label_img(i,j)~=0)
             label_img(i,j) = conn(label_img(i,j));
        end
        
       
    end
end

num = size(unique(label_img));


end
end

% this is a recursive function which iteratively checks if the lookup table
% has the correct value assigned to it.
function [x] = iter(conn,x)
if(conn(x) ~=x)
    x = conn(x);
    iter(conn,x);

end

end


