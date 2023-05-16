clear all;
close all;
clc;

img=imread("image_1615.jpg");
f=ones(3,3)/6; %mean filter kernel
img1= imfilter(img,f);

b(:,:,1)=230-img1(:,:,1);
b(:,:,2)=230-img1(:,:,2);
b(:,:,3)=230-img1(:,:,3);

imgd=im2double(b);

SE=strel('disk',6); 
img2= imdilate(imgd,SE);

img3= imfill(img2,"holes");


 subplot(121);imshow(img); title('Orijinal Image');
% subplot(111);imshow(img1); title('Mean Filter');
% subplot(111),imshow(b); title('CMY Dönüşümü');
 subplot(122),imshow(img3); title('Dönüşüm sonucu');
% subplot(111),imshow(img3); title('imfill Dönüşümü');