clc;
clear;

%% 文件读取
path = "InputImages/";
files = dir(fullfile(path, '*.jpg'));

% for findex = 1:length(files)
%     disp(files(findex).folder + "/" + files(findex).name);
% end
% 选择图片，测试第二张效果最明显
index = 2;
fileTest = files(index).folder+ "/" + files(index).name;
I = imread(fileTest);
I = im2double(I);
% disp(I);
% 原图像
% figure(1)
% imshow(I);

%% 颜色校正
Wnd=15; %领域处理窗口大小
% 获取暗通道先验图片
dark = Idark(I, Wnd);
% imwrite(dark,"OutputImages\dark.jpg"); 

% 根据暗通道先验图片，获取透射率
t = getTransmissivity(I,Wnd, dark);
% imwrite(t,"OutputImages\t.jpg"); 
% 根据透射率获取水下复原图
ccI = colorCorrect(I,dark,t);
imwrite(ccI,"OutputImages\ccI.jpg");
figure(1)
subplot(221),imshow(I),title("原图");
subplot(222),imshow(dark),title("暗通道先验图像");
subplot(223),imshow(t),title("折射率");
subplot(224),imshow(ccI),title("红通道矫正图像");







