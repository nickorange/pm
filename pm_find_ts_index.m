%pm_find_ts_index.m
%Nicholas Orange
%Started: 2016_05_17
%Last edited: 2016_06_08

%Finds index of specified ticker symbol, or ticker symbol of specified index
%Change to check data instead
function out=pm_find_ts_index(in,data)
if nargin<2
    error('Ticker Symbol and Data inputs are required.')
end
num_funds=size(data,1);
if isnumeric(in)
    if (in>0)&&(in<=num_funds)
        out=data{in}.ts;
    else
        error('Index not found in portfolio!')
    end
else
    quit=0;
    i=0;
    while quit==0&&i<num_funds
        i=i+1;
        if strcmp(in,data{i}.ts)
            quit=1;
        end
    end
    if quit==1
        out=i;
    else
        error('Ticker symbol not found in portfolio!')
    end
end