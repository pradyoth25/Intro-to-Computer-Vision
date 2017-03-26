function img_out = Close(img_in,se)

img_part1 = Dil(img_in,se);
img_out = Ero(img_part1,se);

end