function img_out = boundary(img_in,se)

img_part1 = Dil(img_in,se);
img_part2 = Dil(img_part1,se);
img_out =  img_part2 - img_part1;



end