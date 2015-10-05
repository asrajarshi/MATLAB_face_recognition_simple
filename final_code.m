close all;
clear all;
clc;
%% Loading the database into matrix v
w=load_database();
%% Wavelet transform
[xa,xh,xv,xd] = waveletTrans(w); % Wavelet transform%
%% Haar transform
[xaa,xhh,xvv,xdd] = haarTrans(w); % Haar transform%
%% wiener filterig
K = dowiener(w); % Wiener filter
%% Get the test image :
test = rgb2gray(imread('C:\Users\asrajarshi\Desktop\Project\Photos\extra\resized phots\1.jpg'));
figure; imshow(test);
[xat,xht,xvt,xdt] = dwt2(test,'db2');
[xaat,xhht,xvvt,xddt] = dwt2(test,'haar');
Kt = wiener2(test,[5,5]);
%% do correlation
for i = 1: 9
    swa = 0;sh = 0; sww = 0;swv = 0;swd=0;swh=0;shv=0;shd=0;shh=0;
    for j = 1 : 7
        swa = swa + corr2(xat,xa(i).person(j).img);
        swv = swv + corr2(xvt,xv(i).person(j).img);
        swh = swh + corr2(xht,xh(i).person(j).img);
        swd = swd + corr2(xdt,xd(i).person(j).img);
        sh = sh + corr2(xaat,xaa(i).person(j).img);
        shv = shv + corr2(xvvt,xvv(i).person(j).img);
        shh = shh + corr2(xhht,xhh(i).person(j).img);
        shd = shd + corr2(xddt,xdd(i).person(j).img);
        sww = sww + corr2(Kt,K(i).person(j).img);
    end
    wavelet_corr(i) = swa + swh +swv +swd;
    harr_corr(i) = sh+shv+shh+shd;
    wiener_corr(i) = sww;
end
%% find maximum one
for i = 1 :9
    sum(i) = wavelet_corr(i) + harr_corr(i) + wiener_corr(i);
end
[max,index] = max(sum);
figure; imshow(w(index).my_img(1).img);
% [max_h,index_h] = max(harr_corr);
% [max_wi,index_wi] = max(wiener_corr);
%% plot it
figure, bar(sum);
grid on;



