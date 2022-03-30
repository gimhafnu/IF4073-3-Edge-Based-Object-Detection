function image = remove_bg(edge_image, original_image)
s = size(original_image);
m = s(1);
n = s(2);
channel = s(3);
C = zeros(size(original_image));

for i = 1:channel
    for j=1:m
        for k = 1:n
            if edge_image(j,k) ~= 0       
                C(j,k,i) = original_image(j,k,i);
            end
        end
    end
end
C = uint8(C);
image = C;