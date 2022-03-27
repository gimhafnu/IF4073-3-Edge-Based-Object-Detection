function Canny_out = Canny_edge_detect(image)
    temp = 0;
    if size(image,3) == 3
        R = image(:,:,1);
        G = image(:,:,2);
        B = image(:,:,3);
        ER = edge(R, 'canny');
        EG = edge(G, 'canny');
        EB = edge(B, 'canny');
        % temp = ER | EG | EB; % Shows edges detected in any colors
        % temp = ER & EG & EB; % Shows edges detected in all colors
        temp = uint8(cat(3,ER, EG, EB)) * 255;
        
    else
        temp = edge(image, 'canny') * 255;
    end
    
    Canny_out = temp;
end