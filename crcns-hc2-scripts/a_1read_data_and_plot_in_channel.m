data = cell(1,8);
for i= 1:8
    
    data_name= 'd533101.dat';
    
    data1=  LoadBinary(data_name,i);
    data{i}=data1;
    %������data��ǰ10000�����ݵ�
    data1=(1:10000);
    subplot(8,1,i)
    plot(data1)
    
    str2 = sprintf('Channel %d',i);
    title(str2);
    
end