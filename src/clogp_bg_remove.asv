function clogp_out = clogp_bg_remove(image, type, fill_with)
    % Gak tahu bener, gak tahu enggak sih... wkwkwk

    if nargin>3 
        error('Too many arguments');
    elseif nargin<2
        error('Too few arguments');
    elseif nargin==2
        fill_with=255;
    end   


    edged_image = 0;
    if type == "LoG"
        edged_image = LoG_edge_detect(image);
    elseif type == "Prewitt"
        edged_image = Prewitt_edge_detect(image);
    elseif type == "Canny"
        edged_image = Canny_edge_detect(image);
    else
        error("unkown type")
    end
    
    structure_element = strel('disk', 2); % Structuring element 
    closed_edges_image = imclose(rgb2gray(edged_image), structure_element);
    filled_edges_image = imfill(imbinarize(closed_edges_image),"holes");

    s = size(image);
    m = s(1);
    n = s(2);
    channel = s(3);

    C = zeros(size(image));
    
    for i=1:channel
        for j=1:m
            for k = 1:n
                if filled_edges_image(j,k) == 0
                    C(j,k,i) = fill_with;
                else
                    C(j,k,i) = image(j,k,i);
                end
            end
        end
    end
    C = uint8(C);
    clogp_out = C;
end