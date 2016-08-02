%pm_cal_eavg.m
%Nicholas Orange
%Started: 2016_06_16
%Last edited: 2016_06_16

%Calculates exponential moving averages of price data recursively
%DO NOT use in a loop.  Output is vector of moving averages, not a single average
%Feed in an extra month before the time period of interest to allow for
%pre-convergence, then remove the extra portion from output
%Optional price data look-up with pm_retrieve_subdata.m


function ema=pm_cal_eavg(alpha,data,fund,enddate,window,unit)
if nargin<2
    error('Alpha and price data inputs are required at minimum.')
elseif nargin==2
    if ~isnumeric(data)
        error('If giving only one input, input must raw numeric data vector of price.')
    elseif size(data,1)<5
        error('Input data is too small.  Must have at least 5 values in vertical vector to converge.')
    else
        price=data;
    end
elseif nargin<5
    error('Alpha, Data, Fund, End Date, and Time Period are required inputs to retrieve price data.')
elseif nargin==5
    price=pm_retrieve_subdata(data,fund,enddate,window);
elseif nargin==6
    price=pm_retrieve_subdata(data,fund,enddate,window,unit);
end
n=size(price,1);
S=zeros(n,1);
S(1)=price(1);
for t=2:n
    S(t)=alpha*price(t)+(1-alpha)*S(t-1);
end
ema=flipud(S); %flip to latest-price-first convention
if 0
    figure(200)
    plot(1:n,price,'b')
    hold on
    plot(1:n,S,'r')
    hold off
end
end