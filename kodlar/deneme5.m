clear all;
close all;
clc;

img=imread("image_0929.jpg");
f=ones(3,3)/5; %mean filter kernel
img1= imfilter(img,f);

b(:,:,1)=183-img1(:,:,1);
b(:,:,2)=183-img1(:,:,2);
b(:,:,3)=183-img1(:,:,3);

imgd=im2double(b);

SE=strel('disk',4); 
img2= imdilate(imgd,SE);

img3= imfill(img2,"holes");




 subplot(121);imshow(img); title('Orijinal Image');
% subplot(111);imshow(img1); title('Mean Filter');
% subplot(111),imshow(b); title('CMY Dönüşümü');
 subplot(122),imshow(img3); title('Dönüsüm sonucu');
% subplot(111),imshow(img3); title('imfill Dönüşümü');