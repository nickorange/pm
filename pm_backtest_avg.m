%pm_backtest_avg.m
%Nicholas Orange
%Started: 2016_08_02
%Last edited: 2016_08_02

%Calculates result of historical back-test given the following strategy:
%Buy and hold a select list of funds

function ret=pm_backtest_avg(data,fundlist,period)
if nargin<1
    error('Raw Data input is required!')
elseif nargin<3
    period=365;
    if nargin<2
        fundlist='all';
    end
end
if ischar(fundlist)
    if strcmp(fundlist,'all')
        fundlist=1:numel(data);
    else
        error('fundlist must be "all" or a vector of fund ids')
    end
end
if period<1
    error('Period of evaluation must be at least 1 day!')
end

ret_set=zeros(numel(fundlist),1);
q=0;
for i=fundlist
    q=q+1;
    delta=data{i}.price_adj(1)-data{i}.price_adj(period+1);
    ret_set(q)=100*delta/data{i}.price_adj(period+1);
end
ret=mean(ret_set);
end
