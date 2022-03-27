function LoG_out = LoG_edge_detect(image)
    H = [0 0 -1 0 0; 0 -1 -2 -1 0; -1 -2 16 -2 -1; 0 -1 -2 -1 0; 0 0 -1 0 0];
    temp = image;
    for x=1:size(image,3)
        temp_temp = uint8(conv2(double(image(:,:,x)), double(H)));
        temp(:,:,x) = temp_temp(1:size(image,1), 1:size(image,2), 1);
    end
    LoG_out = temp;
end