%数据转化,把读取的Raw data转换成为有电压的data
data1 = data;
v_range = 20; %"Not always verified. From crcns-hc1-data-description.pdf% in the xml file, the v-range is 20
gain_ic=50;
gain_ec=1000;
coef_ic = v_range / (2^16 * gain_ic);
coef_ec = v_range / (2^16 * gain_ec);
data1{1,6} = data1{1,6}.*(coef_ic);%IC Channel;
for i = 2:5
    data1{1,i} = data1{1,i}.*(coef_ec);%EC Channels;
end
data = data1;
