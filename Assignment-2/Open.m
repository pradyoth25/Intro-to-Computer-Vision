function img_out = Open(img_in,se)

img_part1 = Ero(img_in,se);
img_out = Dil(img_part1,se);

end