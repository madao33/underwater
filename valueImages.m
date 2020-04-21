clc
clear;
I1 = imread('InputImages/test1.jpg');
I2 = imread('OutputImages/test1.jpg');
figure(1)
subplot(121)
imshow(I1);
subplot(122)
imshow(I2);
I1 = rgb2gray(I1);
I2 = rgb2gray(I2);
bw1 = imbinarize(I1);
bw2 = imbinarize(I2);
edge1 = edge(bw1,'log');
edge2 = edge(bw2,'log');
figure(2)
subplot(121)
imshow(edge1);
subplot(122)
imshow(edge2);
[m, n] = size(edge1);
cnt1 = 0;
for i = 1:m
    for j = 1:n
        if(edge1(i,j)==1)
            cnt1 = cnt1 + 1;
        end
    end
end
cnt2 = 0;
for i = 1:m
    for j = 1:n
        if(edge2(i,j)==1)
            cnt2 = cnt2 + 1;
        end
    end
end
disp('cnt1:');
disp(cnt1);
disp("cnt2:");
disp(cnt2);
disp(cnt2/cnt1);