function [img img_grad]=HOG(re_img)
%adding zero so that computation can be start from (1,1)
sz_HOG=size(re_img);
x=zeros(sz_HOG(1),1);
re_img=[x re_img x];
sz_HOG=size(re_img);
x=zeros(1,sz_HOG(2));
re_img=[x;re_img;x];
sz_HOG=size(re_img);
%% kernel horizontal and vertical(sobel filter)
horz=[0 -1 0;0 0 0;0 1 0];
vert=[0 0 0;-1 0 1;0 0 0];
H=0;V=0;Hor=zeros(sz_HOG);Ver=zeros(sz_HOG);
%% performing sliding window operation
for i=2:sz_HOG(1)-1
    for j=2:sz_HOG(2)-1
        for k=1:3
            for l=1:3
                H=H+re_img(i-2+k,j-2+l)*horz(k,l);
                V=V+re_img(i-2+k,j-2+l)*vert(k,l);
            end
        end
        %img stores the magnitude of every pixel 
        %img_grad stores the gradient at every pixel
        img(i,j)=sqrt((H^2)+(V^2));
        Hor(i,j)=H;
        Ver(i,j)=V;
        if (V==0)&&(H==0)
            img_grad(i,j)=0;
        elseif (H==0)
            img_grad(i,j)=90;
        elseif (V/H<0)
            img_grad(i,j)=atand((V/H))+180;
        else
            img_grad(i,j)=atand((V/H));
        
        end
        H=0;V=0;
    end
end
quiver(Hor,Ver);
%%removing the zeros from the matrix that are added at the beggining
sz_img=size(img);
img=img(:,2:sz_img(2));
img=img(2:sz_img(1),:);
img_grad=img_grad(:,2:sz_img(2));
img_grad=img_grad(2:sz_img(1),:);
end



