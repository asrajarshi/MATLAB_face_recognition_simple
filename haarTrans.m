function [xar,xhr,xvr,xdr] = haarTrans(a)

for i = 1 : 9
    for j = 1: 7
         [xa,xh,xv,xd]=dwt2(a(i).my_img(j).img,'haar');
         xar(i).person(j).img = xa/255;
         xhr(i).person(j).img = xh;
         xvr(i).person(j).img = xv;
         xdr(i).person(j).img = xd;
    end
end