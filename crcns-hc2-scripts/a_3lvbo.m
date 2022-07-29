load('b_Extracted_channel_file.mat','data')
for i =2:6
    x  = reshape(data{1},[],1);
    %{
    %更早的FAST算法的作者写的内容
    n = 8  ;
    %涉及到角频率和Hz的转换
    Wp = 300/500;
    Ws = 7500/500;
    Rp = 3;
    Rs = 60;

    [z,p,k] = ellip(n/2,5,50,[300,4999]/5000,'stop');%因为采样频率为10000,无法满足保留300-7500Hz的要求，只可以保留300-4999Hz。
    sos = zp2sos(z,p,k);
    fvtool(sos,'Analysis','freq')
    dataIn = randn(1000,1);
    dataOut = filter(z,p,dataIn);
    %}

    %本篇论文的做法的做法
    x = decimate(x,5,4);
    x = decimate(x,5,4);
    x = decimate(x,4,4);
    %
    [S,t,f,Serr]=mtspecgramc(x,[5,1]);
end


