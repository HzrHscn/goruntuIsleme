clear all;
close all;
clc;

img=imread("image_0348.jpg");

SE=strel('disk',4); 
img1=imerode(img,SE);
D = imfill(img1,"holes");

b(:,:,1)=99-D(:,:,1);
b(:,:,2)=99-D(:,:,2);
b(:,:,3)=99-D(:,:,3);

[L,Centers] = imsegkmeans(b,2);
C = labeloverlay(b,L);


subplot(1,1,1),imshow(C);