clear all;
clc;
%reading image
img=imread('image.png');
img=double(img);

%resizing image according to the requirement of the classifier which is 128*64
resize_img=resize_image(img);
sz_resize_img=size(resize_img);

%function that will calculate the Histogram of gradient of the resized image
[mag grad]=HOG(resize_img);

%Now this functin will calculate the HOG as feature vector by making 8*8 matrix
histogram_of_grad=hist_of_grad(mag,grad);
resize_img=uint8(resize_img');
resize_img=resize_img';
imshow(resize_img);
hold on;


