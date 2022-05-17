%% Q1
clear all, close all
A = [4 5 -9 -5; 3 -7 1 2; 6 -1 -6 1; 3 -1 7 -5];
[n,m] = size(A);
% Perform fft
tic
A1 = fft(A,m,2);
newA1 = abs(fft(A1,n,1));
toc
tic
newA2 = abs(fft2(A));
toc
%% Q2
close all; clear all;
A=rgb2gray(imread("C:\Users\rom21\OneDrive\Desktop\ex3\clown.jpeg"));
A2=fftshift(fft2(A));
% setting the filter:
[m,n]=size(A);
H=zeros(m,n);
radius=10;
cycle_filter = fspecial('disk', radius);
H(130,125)=1;
H(166,98)=1;
H(156,160)=1;
H(115,185)=1;
Hnew=conv2(cycle_filter,H);
Hnew2=~Hnew;
G=A2.*Hnew2(1:m,1:n);
recImg=ifft2(ifftshift(G));
%figure; imshow(log(abs(A2)),[]); title('fftshift(fft2(image))');hp = impixelinfo;
% Results
figure;
subplot(2,2,1); imshow(A); title('Original Image');
subplot(2,2,2); imshow(log(abs(A2)),[]); title('fftshift(fft2(image))');
subplot(2,2,3); imshow(log(abs(G)),[]); title('BPF');
subplot(2,2,4); imshow(abs(recImg),[]); title('BPF');

%% Q6

max_iterations = 1000;
iterations = 0;
epsil = 0.00001;
r = [[0, 0.666, 1]]; 
f = [[0, 0]]; 
for i = 1:max_iterations 
   for k = 1:2 
       f(i, k) = ((2/3)*(((r(i, k + 1))^3) - (r(i, k))^3))/(((r(i, k + 1))^2) - ((r(i, k))^2));
   end
   r(i+1, 1) = 0;
   r(i+1, 2) = (f(i, 1) + f(i, 2))/2;
   r(i+1, 3) = 1;
   
   if (abs(r(i+1,2) - r(i,2)) < epsil)
      iterations = i;
      break 
   end
end
 
figure; plot(1:iterations, r(1:iterations,2)); title('Max Lloyed, zoom in on r');
legend('r(2)');
xlabel('Iterations'); ylabel('Gray value'); grid;
 
figure; plot(1:iterations, f, 1:iterations, r(1:iterations,2)); title('Max Lloyed');
legend('f(1)','f(2)','r(2)');
xlabel('Iterations'); ylabel('Gray value'); grid;

