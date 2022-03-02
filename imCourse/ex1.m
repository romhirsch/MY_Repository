clear all
addpath("C:\Users\rom21\OneDrive\Desktop\rep\MY_Repository\imCourse")
img = imread("imgB.jpg");
h = imshow('imgB.jpg');
hp = impixelinfo;

mask_b = ((img(:,:,3) < 180 ) & (img(:,:,1) < 130) & (img(:,:,2) < 130) & (img(:,:,3) - img(:,:,2) > 20 ) & (img(:,:,3)) -img(:,:,1) > 20  ); 
%%
imshow(uint8(~mask_b).*img)
mask_img = uint8(~mask_b).*img;
%mask_img(mask_img==0)=255;
imshow(mask_img)
img_bck = imread("tire.tif");
img_bck = imresize(img_bck ,size(mask_img(:,:,1)));
imshow(img_bck.*unit8(mask_b))
imshow(mask_img+img_bck.*unit8(mask_b))

%%

h = imshow('hestain.png');
hp = impixelinfo;
set(hp,'Position',[5 1 300 20]);

%%
A = 7;
f = 10;
L = 1;
fs = 12;
Ts = 1/fs;
t = linspace(0,L,L/Ts);
y = sin(2*pi*f*t)
%%

A = 7
f = 10
L = 1
fs = 200
Ts = 1/fs
t = linspace(0,L,(L/Ts));
y = cos(2*pi*f*t);
plot(t,y)
figure;
plot(abs(fft(y)))