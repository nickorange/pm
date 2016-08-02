%pm_backtest_best1.m
%Nicholas Orange
%Started: 2016_08_01
%Last edited: 2016_08_02

%Calculates result of historical back-test given the following strategy:
%Uses hind-sight to pick best 4 performers every 7 days

function ret=pm_backtest_best1(data,period)
if nargin<1
    error('Metrics and score inputs are required!')
elseif nargin<2
    period=365;
end
if period<1
    error('Period of evaluation must be at least 1 day!')
end


end
