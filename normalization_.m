        function [sum_FV_1,sum_FV_2,grad_norm_int]=normalization_(grad_sample,img_sample)
                            sum_FV_1=0;
                            sum_FV_2=0;
                            grad_norm=grad_sample/20;
                            grad_norm_int=floor(grad_norm+1);
                            grad_norm_part_1=abs(grad_norm-grad_norm_int);
                            grad_norm_part_2=abs(1-grad_norm_part_1);
                            sum_FV_1=grad_norm_part_1*img_sample;
                            sum_FV_2=grad_norm_part_2*img_sample;
                            
    end