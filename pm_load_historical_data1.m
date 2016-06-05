%pm_load_historical_data1.m
%Nicholas Orange
%Started: 2016_05_17
%Last edited: 2016_05_31

%Loads price data from csv files specified by fundlist

function data=pm_load_historical_data1(pname)
if nargin<1
    error('Portfolio Name input required.')
end
filepath1=['.\fundlist_',pname,'.csv'];
fileID=fopen(filepath1,'r');
array1=textscan(fileID,'%s%s%s%s%f%[^\n\r]','Delimiter',',','EmptyValue',0.0,'ReturnOnError',false);
fclose(fileID);
num_funds=str2double(array1{1}{1});
pname2=array1{2}{1};
if ~strcmp(pname,pname2)
    error('Mismatch in portfolio name!  Check header in csv file.')
end
%ts_list=cell(num_funds,1);
data=cell(num_funds,1);
for i=1:num_funds
    %ts_list{i}=array1{1}{i+1};
    data{i}.ts=array1{1}{i+1};
    data{i}.title=array1{2}{i+1};
    if strcmp(array1{3}{i+1},'Listed')
        data{i}.listed=1;
    else
        data{i}.listed=0;
    end
    data{i}.r_type=array1{4}{i+1};
    data{i}.r_period=array1{5}(i+1);
    data{i}.filepath=['.\data_',pname,'\',data{i}.ts,'.csv'];
    fileID=fopen(data{i}.filepath,'r');
    array2=textscan(fileID,'%q%f%f%f%f%f%f%[^\n\r]','Delimiter',',','EmptyValue',NaN,'HeaderLines',1,'ReturnOnError',false);
    fclose(fileID);
    data{i}.num_entries=size(array2{1},1);
    data{i}.date_num=pm_convert_date(array2{1});
    data{i}.date_str=pm_convert_date(data{i}.date_num);
    %data{i}.date_str=array2{1};
    data{i}.price=array2{5}; %Closing price
    data{i}.price_adj=array2{7}; %Adjusted closing price
end
end