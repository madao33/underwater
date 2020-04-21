clc;
clear;

%% �ļ���ȡ
path = "InputImages/";
files = dir(fullfile(path, '*.jpg'));

% for findex = 1:length(files)
%     disp(files(findex).folder + "/" + files(findex).name);
% end
% ѡ��ͼƬ�����Եڶ���Ч��������
index = 2;
fileTest = files(index).folder+ "/" + files(index).name;
I = imread(fileTest);
I = im2double(I);
% disp(I);
% ԭͼ��
% figure(1)
% imshow(I);

%% ��ɫУ��
Wnd=15; %�������ڴ�С
% ��ȡ��ͨ������ͼƬ
dark = Idark(I, Wnd);
% imwrite(dark,"OutputImages\dark.jpg"); 

% ���ݰ�ͨ������ͼƬ����ȡ͸����
t = getTransmissivity(I,Wnd, dark);
% imwrite(t,"OutputImages\t.jpg"); 
% ����͸���ʻ�ȡˮ�¸�ԭͼ
ccI = colorCorrect(I,dark,t);
imwrite(ccI,"OutputImages\ccI.jpg");
figure(1)
subplot(221),imshow(I),title("ԭͼ");
subplot(222),imshow(dark),title("��ͨ������ͼ��");
subplot(223),imshow(t),title("������");
subplot(224),imshow(ccI),title("��ͨ������ͼ��");







