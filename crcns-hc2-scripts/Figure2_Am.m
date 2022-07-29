data = LoadBinary('d533101.dat',8);
%Split the channel, Matlab是从1开始作为起始index
Channel_0 = [];
Channel_1 = [];
Channel_2 = [];
Channel_3 = [];
Channel_4 = [];
Channel_5 = [];
Channel_6 = [];
Channel_7 = [];

parfor i=1:2400256
    if mod(i,8)==0
        Channel_0=[Channel_0,data(i)];
    end
    if (mod(i,8)==1)
        Channel_1=[Channel_1,data(i)];
    end
    if (mod(i,8)==2)
        Channel_2=[Channel_2,data(i)];
    end
    if (mod(i,8)==3)
        Channel_3=[Channel_3,data(i)];
    end
    if (mod(i,8)==4)
        Channel_4=[Channel_4,data(i)];
    end
    if (mod(i,8)==5)
        Channel_5=[Channel_5,data(i)];
    end
    if (mod(i,8)==6)
        Channel_6=[Channel_6,data(i)];
    end
    if (mod(i,8)==7)
        Channel_7=[Channel_7,data(i)];
    end
end
    
