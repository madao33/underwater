function Jdark = Idark(I, Wnd)
%Jdark 暗通道先验
%   I-输入图像
%   Jark1-输出图像

% output： Jdark = min(min(r),min(g),min(b));
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);
%% 图像拓展
[m,n,~] = size(I);
Irr = ones(m+Wnd-1, n+Wnd-1); 
Irr((Wnd-1)/2 : m+(Wnd-1)/2-1 , (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ir;
Igg = ones(m+Wnd-1, n+Wnd-1); 
Igg((Wnd-1)/2 : m+(Wnd-1)/2-1 , (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ig;
Ibb = ones(m+Wnd-1, n+Wnd-1); 
Ibb((Wnd-1)/2 : m+(Wnd-1)/2-1, (Wnd-1)/2 : n+(Wnd-1)/2-1 ) = Ib;
%% 暗通道
Jdark = zeros(m,n);
for i=1:1:m
    for j=1:1:n
        Rmin = min(min ( Irr(i:i+Wnd-1, j:j+Wnd-1) ));
        Gmin = min(min ( Igg(i:i+Wnd-1, j:j+Wnd-1) ));
        Bmin = min(min ( Ibb(i:i+Wnd-1, j:j+Wnd-1) ));
        Jdark(i,j) = min(min(Rmin,Gmin),Bmin);
    end
end
 

end

