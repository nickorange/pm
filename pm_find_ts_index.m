%pm_find_ts_index.m
%Nicholas Orange
%Started: 2016_05_17
%Last edited: 2016_05_31

%Finds index of specified ticker symbol
%Change to check data instead
function ind=pm_find_ts_index(ts,data)
if nargin<2
    error('Ticker Symbol and Data inputs are required.')
end
num_funds=size(data,1);
quit=0;
i=0;
while quit==0&&i<num_funds
    i=i+1;
    if strcmp(ts,data{i}.ts)
        quit=1;
    end
end
if quit==1
    ind=i;
else
    error('Ticker symbol not found in portfolio!')
end
end