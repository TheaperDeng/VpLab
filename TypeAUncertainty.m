function [Out,Mean]=TypeAUncertainty(input)
%   TYPEAUNCERTAINTY Calculate Type-A uncertainty and mean
%   TypeAUncertainty(input) Calculate the input array(input)'s Type-A
%   uncertainty and mean in physics lab
%   NOTE: input should keep its length in 3~10
%
%   For example
%       [u,m]=TypeAUncertainty([0.9,1.0,1.1,0.95])
%       m =0.9875
%       u =0.0116
t95=[2.48,1.59,1.204,1.05,0.926,0.834,0.770,0.715];%输入矫正数据（按照uncertainty handbook输入）
lengthinput=length(input);%input长度
%防止超出长度
if lengthinput>10||lengthinput<3
    Out='The length of arrow should be controled between 3 and 10.';
    return;
end
std=0;
%按照公式计算std
for i=1:lengthinput
    std=std+(input(i)-mean(input)).^2;
end
std=std./(lengthinput-1);
%与矫正数据乘
Out=std*t95(lengthinput-2);
Mean=mean(input);