%pm_compute_metrics1.m
%Nicholas Orange
%Started: 2016_06_01
%Last edited: 2016_06_05

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
    m{i}.ret_1day=zeros(tf,2);
    m{i}.ret_2day=zeros(tf,2);
    m{i}.ret_3day=zeros(tf,2);
    m{i}.ret_4day=zeros(tf,2);
    m{i}.ret_5day=zeros(tf,2);
    m{i}.ret_1week=zeros(tf,2);
    m{i}.ret_2week=zeros(tf,2);
    m{i}.ret_1month=zeros(tf,2);
    m{i}.poly_1week=zeros(tf,2);
    m{i}.poly_2week=zeros(tf,2);
    m{i}.sma_1week=zeros(tf,1);
    m{i}.sma_2week=zeros(tf,1);
    m{i}.wma_1week=zeros(tf,1);
    m{i}.wma_2week=zeros(tf,1);
    for t=1:tf
        price_1month=pm_retrieve_subdata(data,i,t,30);
        price_1day=price_1month(end-1:end);
        price_2day=price_1month(end-2:end);
        price_3day=price_1month(end-3:end);
        price_4day=price_1month(end-4:end);
        price_5day=price_1month(end-5:end);
        price_1week=price_1month(end-7:end);
        price_2week=price_1month(end-14:end);
        m{i}.ret_1day(t,:)=pm_cal_return1(price_1day);
        m{i}.ret_2day(t,:)=pm_cal_return1(price_2day);
        m{i}.ret_3day(t,:)=pm_cal_return1(price_3day);
        m{i}.ret_4day(t,:)=pm_cal_return1(price_4day);
        m{i}.ret_5day(t,:)=pm_cal_return1(price_5day);
        m{i}.ret_1week(t,:)=pm_cal_return1(price_1week);
        m{i}.ret_2week(t,:)=pm_cal_return1(price_2week);
        m{i}.ret_1month(t,:)=pm_cal_return1(price_1month);
        m{i}.poly_1week(t,:)=pm_cal_polyfit1(price_1week);
        m{i}.poly_2week(t,:)=pm_cal_polyfit1(price_2week);
        m{i}.sma_1week(t)=pm_cal_savg(price_1week);
        m{i}.sma_2week(t)=pm_cal_savg(price_2week);
        m{i}.wma_1week(t)=pm_cal_wavg(price_1week);
        m{i}.wma_2week(t)=pm_cal_wavg(price_2week);
        %More metrics...
    end
end
m=pm_score_metrics1(m);
fprintf('Done.\n')
end