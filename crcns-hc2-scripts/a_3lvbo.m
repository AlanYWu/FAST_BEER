load('b_Extracted_channel_file.mat','data')
for i =2:6
    x  = reshape(data{1},[],1);
    %{
    %�����FAST�㷨������д������
    n = 8  ;
    %�漰����Ƶ�ʺ�Hz��ת��
    Wp = 300/500;
    Ws = 7500/500;
    Rp = 3;
    Rs = 60;

    [z,p,k] = ellip(n/2,5,50,[300,4999]/5000,'stop');%��Ϊ����Ƶ��Ϊ10000,�޷����㱣��300-7500Hz��Ҫ��ֻ���Ա���300-4999Hz��
    sos = zp2sos(z,p,k);
    fvtool(sos,'Analysis','freq')
    dataIn = randn(1000,1);
    dataOut = filter(z,p,dataIn);
    %}

    %��ƪ���ĵ�����������
    x = decimate(x,5,4);
    x = decimate(x,5,4);
    x = decimate(x,4,4);
    %
    [S,t,f,Serr]=mtspecgramc(x,[5,1]);
end


