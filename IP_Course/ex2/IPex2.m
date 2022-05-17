%% question 1 
% a.
addpath("C:\Program Files\MATLAB\R2020a\toolbox\images\imdata");
img=imread('cameraman.tif');

G1 = img;
G1(img < 125) = 0;

G2 = img;
G2(img > 125) = 0;

figure;
subplot(2,1,1);
imshow(G1);
title("G1");


subplot(2,1,2);
imshow(G2);
title("G2");

%% b
W = zeros(3);
W(2,2) = 1;

%% 2

% a. 

img_tire=imread('tire.tif');
[n,m] = size(img_tire);
counts = imhist(img_tire);
s_tire = cumsum(counts);
G_tire = zeros(n,m);
LU_tire = uint8(floor(s_tire/(n*m/(256)) -1));
for c = 1:n
    for r = 1:m
        G_tire(c,r) = LU_tire(img_tire(c,r)+1);
    end
end
G_tire = uint8(G_tire);
% b. 

img_cam=imread('cameraman.tif');
[n,m] = size(img_cam);
counts = imhist(img_cam);
s_cam = cumsum(counts);
G_cam = zeros(n,m);
LU_cam = uint8(floor(s_cam/(n*m/(256)) -1));
for c = 1:n
    for r = 1:m
        G_cam(c,r) = LU_cam(img_cam(c,r)+1);
    end
end
G_cam = uint8(G_cam);


figure; subplot(3,2,1);
imshow(img_cam); title('cam original');
subplot(3,2,2); 
imshow(img_tire); title('tire original');
subplot(3,2,3);
imhist(img_cam); title('cam histeq');
subplot(3,2,4); 
imhist(img_tire); title('tire histeq');
subplot(3,2,5);
plot(s_cam); title('cam accumulative');
subplot(3,2,6 );
plot(s_tire); title('tire accumulative');

figure; subplot(4,4,1);
imshow(G_cam); title('histeq cam custom');
subplot(3,4,2); 
imshow(G_tire); title('histeq tire custom');
subplot(3,4,3); 
j_cam = histeq(img_cam);
imshow(j_cam); title('histeq cam');
subplot(3,4,4); 
j_tire = histeq(img_tire);
imshow(j_tire); title('histeq tire');
subplot(3,4,5);
imhist(G_cam); title('custom cam hist');
subplot(3,4,6); 
imhist(G_tire); title('custom tire hist');
subplot(3,4,7);
imhist(j_cam); title('hist cam');
subplot(3,4,8);
imhist(j_tire); title('hist tire');
subplot(3,4,9);
plot(LU_cam); title('Transform cam');
subplot(3,4,10);
plot(LU_tire); title('Transform tire');

