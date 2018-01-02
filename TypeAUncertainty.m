function Out=TypeAUncertainty(input)
t95=[2.48,1.59,1.204,1.05,0.926,0.834,0.770,0.715];
lengthinput=length(input);
if lengthinput>10||lengthinput<3
    Out='³¬³öÊ¹ÓÃ·¶Î§';
    return;
end
std=0;
for i=1:lengthinput
    std=std+(input(i)-mean(input)).^2;
end
std=std./(lengthinput-1);
Out=std*t95(lengthinput-2);