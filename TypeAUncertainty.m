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
t95=[2.48,1.59,1.204,1.05,0.926,0.834,0.770,0.715];%����������ݣ�����uncertainty handbook���룩
lengthinput=length(input);%input����
%��ֹ��������
if lengthinput>10||lengthinput<3
    Out='The length of arrow should be controled between 3 and 10.';
    return;
end
std=0;
%���չ�ʽ����std
for i=1:lengthinput
    std=std+(input(i)-mean(input)).^2;
end
std=std./(lengthinput-1);
%��������ݳ�
Out=std*t95(lengthinput-2);
Mean=mean(input);