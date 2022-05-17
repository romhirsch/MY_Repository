
%% Chromatic Adaptation - white balance 
Ma_bradford = [0.8951 0.2664 -0.1614; -0.7502 1.7135 0.0367; -0.0389 -0.0685 1.0296]
Ma_XYZ = eye(3);
P = imread('ColorChecker2.jpg');
Pxyz = rgb2xyz(double(P)/255);
[numRows, numColumns, ch] = size(P);
Ma_bradford = [0.8951 0.2664 -0.1614; -0.7502 1.7135 0.0367; -0.0389 -0.0685 1.0296]
Wd = rgb2xyz([1 1 1]);
Ws = rgb2xyz([171 169 172]./255);
S = Ma_bradford*Ws';
D = Ma_bradford*Wd';
M = inv(Ma_bradford) * [D(1)/S(1) 0 0; 0 D(2)/S(2) 0 ; 0 0 D(3)/S(3)] * Ma_bradford
temp = double(reshape(Pxyz, numRows * numColumns, 3)) * M';
Result = reshape(temp, numRows, numColumns, 3);
Result = xyz2rgb(Result);
figure;
subplot(121); imshow(Result); title('Chromatic Adaptation - white balance');
subplot(122); imshow(P); title('orig');
impixelinfo;


%% MULTI-COLOR BALANCE FOR COLOR CONSTANCY

clear all; clc;
P = imread("ColorChecker2.jpg");
P_groundture = imread("ColorChecker_groundtrue.jpg");

[numColumns, numRows, ch] = size(P);
Pxyz = rgb2xyz(double(P)/255);
% target points 
T_w = rgb2xyz(double([171 169 172])/255);
T_r = rgb2xyz(double([126 18 18])/255);
T_g = rgb2xyz(double([28 90 51])/255);
T_b = rgb2xyz(double([20 23 76])/255);
Wd_white = rgb2xyz(double([243 234 229])/255);
Wd_red = rgb2xyz(double([194 40 30])/255);
Wd_green = rgb2xyz(double([66 150 73])/255);
Wd_blue = rgb2xyz(double([35 45 140])/255);

% calc matrics M1 ... Mn (n=4) 
M1 = calc_Mm(Wd_white, T_w);
M2 = calc_Mm(Wd_red, T_r);
M3 = calc_Mm(Wd_green, T_g);
M4 = calc_Mm(Wd_blue, T_b);
res = zeros(size(P)); % result image


for c = 1:numColumns
    for r = 1:numRows
       % distance between PXYZ and Tm (dm):  
       d1 = calc_dm(Pxyz(c,r,:),T_w); 
       d2 = calc_dm(Pxyz(c,r,:),T_r);
       d3 = calc_dm(Pxyz(c,r,:),T_g);
       d4 = calc_dm(Pxyz(c,r,:),T_b);
       % inverse proportion to dm (dm'):
       dd1 = (d1+d2+d3+d4)/d1;
       dd2 = (d1+d2+d3+d4)/d2;
       dd3 = (d1+d2+d3+d4)/d3;
       dd4 = (d1+d2+d3+d4)/d4;
       % if target km will be infinite if input pixel PXYZ is
       % equal to Tm (i.e. dm = 0). In this case, let km be a value of
       % 1, and let the other weights be a value of zero.
       if (d1 == 0)
           k1 = 1;
           k2 = 0;
           k3 = 0;
           k4 = 0;   
       elseif(d2==0)       
           k1 = 0;
           k2 = 1;
           k3 = 0;
           k4 = 0; 
       elseif (d3==0) 
           k1 = 0;
           k2 = 0;
           k3 = 1;
           k4 = 0;   
           
       elseif (d4==0)
           k1 = 0;
           k2 = 0;
           k3 = 0;
           k4 = 1; 
       else
       % value of weights km:
           k1 = dd1 / (dd1 + dd2 + dd3 + dd4);
           k2 = dd2 / (dd1 + dd2 + dd3 + dd4);
           k3 = dd3 / (dd1 + dd2 + dd3 + dd4);
           k4 = dd4 / (dd1 + dd2 + dd3 + dd4);
       end
       % calc n matric  
       Mncb = k1*M1+k2*M2+k3*M3+k4*M4;
       pixel=reshape(Pxyz(c,r,:),1,3);
       res(c,r,:) = Mncb*pixel';
    end
end
resRGB = uint8(xyz2rgb(res)*255); % convert to RGB from xyz 

figure 
subplot(131);imshow(P); title('orig');
subplot(132);imshow(resRGB); title('n color balance');
subplot(133);imshow(P_groundture); title('groundtrue');
impixelinfo;
%%
function dm = calc_dm(Pxyz,Tm)
    Xp = Pxyz(1);
    Yp = Pxyz(2);
    Zp = Pxyz(3);
    Xtm = Tm(1);
    Ytm = Tm(2);
    Ztm = Tm(3);
    dm = sqrt((Xp/Yp -Xtm/Ytm)^2+(Zp/Yp - Ztm/Ytm)^2);
end

function M = calc_Mm(Wd,Ws)
   Ma_bradford = [0.8951 0.2664 -0.1614; -0.7502 1.7135 0.0367; -0.0389 -0.0685 1.0296];
   Ma = Ma_bradford;    
   S = Ma_bradford*Ws';
   D = Ma_bradford*Wd';
   M = inv(Ma) * [D(1)/S(1) 0 0; 0 D(2)/S(2) 0 ; 0 0 D(3)/S(3)] * Ma;
end


