%�����ݷֳ�15��block������ÿ��block������100ms����ֹedge effect
%˼·��������ݵ�ʱ��������15�����������з�����
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