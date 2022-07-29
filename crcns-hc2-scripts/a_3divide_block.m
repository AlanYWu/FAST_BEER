%把数据分成15个block，并且每个block后面有100ms来防止edge effect
%思路：获得数据的时长，除以15，采用数据切分来做
len =size(data{1});
increment = round(len(2)/15);
data_block = cell(8,15);
for i = 1:8
    for j =1:15
        data1 = data{i};
        if j<=14
            data2 = data1(1,(increment*(j-1)+1):(increment*j+101));
        end
        if j == 15
            data2 = data1(1,(increment*14:increment*15));
        end
        data_block{i,j} = data2;
    end
end