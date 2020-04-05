function [nimg]=resize_image(oimg)
sz_resize=size(oimg);
nrow=64;
ncol=128;
rowratio=nrow/sz_resize(1);
colratio=ncol/sz_resize(2);
IR=ceil([(1:sz_resize(1)*rowratio)]./rowratio);
CR=ceil([(1:sz_resize(2)*colratio)]./colratio);
nimg=oimg(:,IR);
nimg=nimg(CR,:);
end
