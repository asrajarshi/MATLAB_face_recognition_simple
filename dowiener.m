function K = dowiener(a)
%% do wiener
for i = 1 : 9
    for j = 1: 7
        aa = a(i).my_img(j).img;
        K(i).person(j).img = wiener2(aa,[5 5]); % Wiener filter
    end
end