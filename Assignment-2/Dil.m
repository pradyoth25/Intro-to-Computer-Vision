function img_out = Dil(img_in,se)
si = size(img_in);
sii = size(se);
img_out = zeros(si(1),si(2));
for i=1:si(1)-sii(1)
    for j=1:si(2)-sii(2)
           ck = 0;
           % Here, ck is the check counter. Which checks if any of the
           % pixels match between the SE and Input Image
           for k=1: sii(1)
              for l =1: sii(2)
                 if img_in(i+k-1,j+l-1) == se(k,l)
                     ck = 1;
                 end
              end
           end
           
            img_out(i,j) = ck ;
    end    

end
end