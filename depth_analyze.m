clear all;
close all;
clc;

%% get my dataset
path_name = 'D:\git\log\200227_RGB_2_3\DenseDepthResult\DepthImage';
path_name_depth = 'D:\git\log\200227_RGB_2_3\DenseDepthResult\DepthArray';
lists = dir(path_name);
lists_d = dir(path_name_depth);
n = length(lists);

%% 
idx = 1;
for i=3:1:n
    i
    file_name = strcat(path_name, '\', lists(i).name);
    img = imread(file_name);
    file_name_depth = strcat(path_name_depth, '\', lists_d(i).name);
    depth = load(file_name_depth);
    maxd(idx,1) = max(max(depth));
    
    figure(1)
    histogram(depth)
    hold on
    axis([0 0.15 0 15000])
    hold on
    
    idx = idx+1;
    
%     if(i==n)
%         G = histogram(depth);
%         C = colormap; 
%         L = size(C,1);
%         Gs = round(interp1(linspace(min(G(:)),max(G(:)),L),1:L,G));
%         H = reshape(C(Gs,:),[size(Gs) 3]);
%         
%         figure(3)
%         image(H) 
% 
%         % Save Image
%         path_name_save = 'D:\git\log\200121_RGB_2\DenseDepthResult\DepthAnalyze';
%         file_name_save = strcat(path_name_save, '\', (lists_d(i).name));
%         imwrite(H,[strcat(path_name_save,'\',file_name_save ,'.jpg')]);
%     end
end




