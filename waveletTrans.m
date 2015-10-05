function [xar,xhr,xvr,xdr] = waveletTrans(a)
%% taking wavelet transform
for i = 1 : 9
    for j = 1: 7
         [xa,xh,xv,xd]=dwt2(a(i).my_img(j).img,'db2');
         xar(i).person(j).img = xa/255;
         xhr(i).person(j).img = xh;
         xvr(i).person(j).img = xv;
         xdr(i).person(j).img = xd;
    end
end







