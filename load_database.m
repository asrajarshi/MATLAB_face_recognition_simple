function out=load_database()
  %% fdfd
  myDir = 'C:\Users\asrajarshi\Desktop\Project\Photos\cropeed\resized phots\';
    ext_img = '*.jpg';
    a = dir([myDir ext_img]);
    nfile = max(size(a)) ;
    %[a,index] = sort_nat(aa);
    %% v ff   
    t =0;
    j=0;
    for i = 1 : 9
        while t < nfile
          j = j + 1;
          t = t+1;
          myimg(i).my_img(j).img = rgb2gray(imread([myDir a(t).name]));
          if j == 7
              j = 0;
              break;
          end
        end
    end
out = myimg;