function Prewitt_out = Prewitt_edge_detect(image)
    Px = [-1 0 1; -1 0 1; -1 0 1];
    Py = [-1 -1 -1; 0 0 0; 1 1 1];
    temp = image;

    for x=1:size(image,3)
        Prewitt_x = conv2(double(image(:,:,x)), double(Px), 'same');
        Prewitt_y = conv2(double(image(:,:,x)), double(Py), 'same');
        temp_temp = uint8(sqrt(Prewitt_x.^2 + Prewitt_y.^2));

        temp(:,:,x) = temp_temp(1:size(image,1), 1:size(image,2), 1);
    end
    Prewitt_out = temp;
end