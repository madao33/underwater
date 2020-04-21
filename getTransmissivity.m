function t = getTransmissivity(I, Wnd, dark)
%getTransmissivity 获取透射率
%   I-输入图像矩阵
%   t-透射率矩阵
A = max(max(dark));
disp("暗通道最高强度值: ");
disp(A);
%领域窗口大小
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);
%图像大小扩展
[m,n,~] = size(I);
Irr = ones(m+Wnd-1, n+Wnd-1); 
Irr((Wnd-1)/2 : m+(Wnd-1)/2-1 , (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ir;
Igg = ones(m+Wnd-1, n+Wnd-1); 
Igg((Wnd-1)/2 : m+(Wnd-1)/2-1 , (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ig;
Ibb = ones(m+Wnd-1, n+Wnd-1); 
Ibb((Wnd-1)/2 : m+(Wnd-1)/2-1, (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ib;
t = zeros(m,n);
for i=1:1:m
    for j=1:1:n
        Rmin = min(min ( Irr(i:i+Wnd-1, j:j+Wnd-1)/A ));
        Gmin = min(min ( Igg(i:i+Wnd-1, j:j+Wnd-1)/A ));
        Bmin = min(min ( Ibb(i:i+Wnd-1, j:j+Wnd-1)/A ));
        t(i,j) = 1 - min(min(Rmin,Gmin),Bmin);
    end
end
end

