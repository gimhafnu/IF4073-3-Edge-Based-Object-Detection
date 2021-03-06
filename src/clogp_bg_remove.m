function [segment, clogp_out] = clogp_bg_remove(image, type, fill_with)
    % Gak tahu bener, gak tahu enggak sih... wkwkwk

    if nargin>3 
        error('Too many arguments');
    elseif nargin<2
        error('Too few arguments');
    elseif nargin==2
        fill_with=0;
    end   


    edged_image = 0; % Where the image after edge detect will be
    bin_threshold = 0; % Threshold for binarize image
    if type == "LoG"
        edged_image = LoG_edge_detect(image);
        bin_threshold = 4/255;
    elseif type == "Prewitt"
        edged_image = Prewitt_edge_detect(image);
        bin_threshold = 12/255;
    elseif type == "Canny"
        edged_image = Canny_edge_detect(image);
        bin_threshold = 2/255;
    else
        error("unkown type")
    end
    
    structure_element = strel('disk', 2); % Structuring element to help imclose
    grey_edged_image = rgb2gray(edged_image);

    binarized_image = imbinarize(grey_edged_image, bin_threshold);

    % Make sure edges are 'empty' to prevent "closing" the whole image,
    % especially for Prewitt
    image_size = size(binarized_image);
    for i = 1:image_size(1)
        for j = 1:image_size(2)
            if i==1 || i==image_size(1)|| j==1 || j==image_size(2)
                binarized_image(i,j) = 0;
            end
        end
    end
    
    % Cleans the image away from smaller areas (that are most likely not
    % the desired object)
    cleaned_bin_edge_image = bwareaopen(binarized_image, round(image_size(1) * image_size(2) / 223));
    
    % Attempts to close the remaining holes
    closed_edges_image = imclose(cleaned_bin_edge_image, structure_element); % attempts to close holes
    
    % Attempts to fill the holes in the boundary
    filled_edges_image = imfill(closed_edges_image,"holes");
    
    % Gets the image without background, using filled_edges_image as mask
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
    segment = filled_edges_image;
    clogp_out = C;
end