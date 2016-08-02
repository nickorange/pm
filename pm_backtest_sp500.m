%pm_backtest_sp500.m
%Nicholas Orange
%Started: 2016_08_01
%Last edited: 2016_08_01

%Calculates result of historical back-test given the following strategy:
%Buy and hold S&P 500 fund

function ret=pm_backtest_sp500(data,period)
if nargin<1
    error('Raw Data input is required!')
elseif nargin<2
    period=365;
end
if period<1
    error('Period of evaluation must be at least 1 day!')
end
fund_num=pm_find_ts_index('SVSPX',data);
delta=data{fund_num}.price_adj(1)-data{fund_num}.price_adj(period+1);
ret=100*delta/data{fund_num}.price_adj(period+1);
end
