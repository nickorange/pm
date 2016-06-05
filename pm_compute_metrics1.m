%pm_compute_metrics1.m
%Nicholas Orange
%Started: 2016_06_01
%Last edited: 2016_06_01

%Organizes and performs calculation of all relevant performance metrics
%tf is number of historical days to calculate:
%tf=1 calculates metric for only the most recent day
%tf=60 calculates metrics for the last 60 days, etc.

function m=pm_compute_metrics1(data,tf)
if nargin<2
    error('Data and time period inputs required.')
end
fprintf('Computing performance metrics for last %i days... ',tf)
num_funds=size(data,1);
m=cell(num_funds,1);
for i=1:num_funds
    m{i}.ret_1day=zeros(tf,1);
    m{i}.ret_2day=zeros(tf,1);
    m{i}.ret_3day=zeros(tf,1);
    m{i}.ret_1week=zeros(tf,1);
    m{i}.ret_2week=zeros(tf,1);
    m{i}.ret_1month=zeros(tf,1);
    for t=1:tf
    price_1day=pm_retrieve_subdata(data,i,t,1);
    price_2day=pm_retrieve_subdata(data,i,t,2);
    price_3day=pm_retrieve_subdata(data,i,t,3);
    price_1week=pm_retrieve_subdata(data,i,t,7);
    price_2week=pm_retrieve_subdata(data,i,t,14);
    price_1month=pm_retrieve_subdata(data,i,t,30);
    m{i}.ret_1day(t)=pm_cal_return1(price_1day);
    m{i}.ret_2day(t)=pm_cal_return1(price_2day);
    m{i}.ret_3day(t)=pm_cal_return1(price_3day);
    m{i}.ret_1week(t)=pm_cal_return1(price_1week);
    m{i}.ret_2week(t)=pm_cal_return1(price_2week);
    m{i}.ret_1month(t)=pm_cal_return1(price_1month);
    %More metrics...
    end
end
fprintf('Done.\n')
end