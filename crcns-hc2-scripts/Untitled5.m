load('b_Extracted_channel_file.mat','-mat')
f = cell(1,8)
for i= 1:8
    a = i
    data1 = data{i};
    b = min(data1)
    c = max(data1)
    f{i} = [a,b,c]
end