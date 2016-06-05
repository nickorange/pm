%pm_cal_return1.m
%Nicholas Orange
%Started: 2016_05_31
%Last edited: 2016_06_01

%Calculates basic percentage return of price data
%Optional price data look-up with pm_retrieve_subdata.m

function ret=pm_cal_return1(data,fund,enddate,period,unit)
if nargin==1
    if ~isnumeric(data)
        error('If giving only one input, input must raw numeric data vector of price.')
    elseif size(data,1)<2
        error('Input data is too small.  Must have at least 2 values in vertical vector.')
    else
        price=data;
    end
elseif nargin<4
    error('Data, Fund, End Date, and Time Period are required inputs to retrieve price data.')
elseif nargin==4
    price=pm_retrieve_subdata(data,fund,enddate,period);
elseif nargin==5
    price=pm_retrieve_subdata(data,fund,enddate,period,unit);
end
ret=100*(price(end)-price(1))/price(1); %Return of initial value in percent
end