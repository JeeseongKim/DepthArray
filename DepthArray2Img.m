clear all;
close all;
clc;

%%
path_name = 'D:\git\log\310_2_2\DenseDepthResult\DepthArray';
% path_name = 'D:\git\log\200121_RGB_1\test_array';
% path_name = 'D:\git\log\200121_RGB_2\DenseDepthResult\DepthArray';
lists = dir(path_name);
n = length(lists);

%%
for i=3:1:n
    file_name = strcat(path_name, '\', lists(i).name);
    tmp = load(file_name);
    
    figure(1)
    G = tmp;
    imagesc(G);
    
    C = colormap; 
    L = size(C,1);
    Gs = round(interp1(linspace(min(G(:)),max(G(:)),L),1:L,G));
    H = reshape(C(Gs,:),[size(Gs) 3]);
       
%     figure(2)
    image(H) 
    
    % Save Image
%     path_name_save = 'D:\git\log\200121_RGB_1\DenseDepthResult\DepthImage';
    path_name_save = 'D:\git\log\310_2_2\DenseDepthResult\DepthImage';
%     file_name_save = strcat(path_name_save, '\', (lists(i).name));
    file_name_save = strcat(path_name_save, (lists(i).name));
    imwrite(H,[strcat(path_name_save,'\',file_name_save(47:58) ,'.jpg')]);
    
end



%%
% path_name = 'D:\git\SLAM_JSK_original\depth_array2img\data';
% lists = dir(path_name);
% n = length(lists);
% 
% for i=3:1:n
%     file_name = strcat(path_name, '\', lists(i).name);
%     img = file_name;
%     figure(1)
%     imshow(img)
%     
%     img_crp = imcrop(img,[254,186,574,426]);
%     figure(2)
%     imshow(img_crp)
% end


