image = imread('image_0510.png');

subplot(1, 2, 1);
imshow(image);
title('Original');

% Bir eşik kullanarak görüntüyü ikili görüntüye dönüştürme
threshold = 90;
image = image > threshold;

% Görüntüyü ters çevirme
image = ~image;

% Canny kenar dedektörünü kullanarak görüntüdeki kenarları tespit etme
edges = edge(image, 'canny');

% Nesnelere karşılık gelen bölgeleri doldurma
filledImage = imfill(edges, 'holes');

% Algılanan nesnenin özelliklerini ölçme
stats = regionprops(filledImage, 'Area', 'Centroid', 'BoundingBox');

% İzole edilmiş nesneyi tutmak için boş bir görüntü oluşturma
isolatedObjects = zeros(size(image));

% Algılanan nesneler arasında döngü oluşturma
% ve bunları görüntüde izole etme
for i = 1:numel(stats)
  boundingBox = stats(i).BoundingBox;
  xMin = max(round(boundingBox(1)), 1);
  yMin = max(round(boundingBox(2)), 1);
  xMax = min(round(boundingBox(1) + boundingBox(3)), size(image, 2));
  yMax = min(round(boundingBox(2) + boundingBox(4)), size(image, 1));
  isolatedObjects(yMin:yMax, xMin:xMax) = image(yMin:yMax, xMin:xMax);
end

% İzole edilmiş nesneyi görüntüleme
subplot(1, 2, 2);
imshow(isolatedObjects);
title('Isolated');