function  [FV]=hist_of_grad(mag,grad)
sz_mag=size(mag);
% feature vector size because (64/8) on the x axis and (128/8) on y axis
%9  because the gradient is divided into 9 parts [20 to 180]
FV=zeros(128,9);
m=1;
for i=1:8:sz_mag(1)
    for j=1:8:sz_mag(2)
        sum=zeros(1,9);
                for k=i:i+7
                    for l=j:j+7
                           grad_sample=grad(k,l);
                            img_sample=mag(k,l);
                            [sum_FV1,sum_FV2,pos]=normalization_(grad_sample,img_sample);
                            sum(pos)=sum(pos)+sum_FV1;
                            if sum_FV2>0
                                if(pos==9)
                                sum(1)=sum(1)+sum_FV2;
                                else
                                sum(pos+1)=sum(pos+1)+sum_FV2;
                            end
                    end
                    end
                end
           FV(m,:)=sum;
           m=m+1;
end
end
end



                
    