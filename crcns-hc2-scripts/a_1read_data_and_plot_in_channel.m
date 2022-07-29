data = cell(1,8);
for i= 1:8
    
    data_name= 'd533101.dat';
    
    data1=  LoadBinary(data_name,i);
    data{i}=data1;
    %画出来data的前10000个数据点
    data1=(1:10000);
    subplot(8,1,i)
    plot(data1)
    
    str2 = sprintf('Channel %d',i);
    title(str2);
    
end