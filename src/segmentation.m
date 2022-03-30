function image = segmentation(bw, type)
n = 0;
if type == "laplacian"
    n = 1;
elseif type == "roberts"
    n = 8;
elseif type == "sobel"
    n = 25;
end

bw = imbinarize(bw,n/255);
k = 1;
[x, y] = size(bw);
for i = 1:x
    for j = 1:y
        if i==1 || i==x|| j==1 || j==y
            bw(i,j,k) = 0;
        end
    end
end
bw = bwareaopen(bw, 1000);
bw = imfill(bw, 'holes');
image = bw;