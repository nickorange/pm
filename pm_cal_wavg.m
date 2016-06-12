%pm_cal_wavg.m
%Nicholas Orange
%Started: 2016_06_11
%Last edited: 2016_06_11

%Calculates weighted average of price data
%Optional price data look-up with pm_retrieve_subdata.m
%Use in a loop to generate weighted moving averages

function wavg=pm_cal_wavg(data,fund,enddate,window,unit)
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
    price=pm_retrieve_subdata(data,fund,enddate,window);
elseif nargin==5
    price=pm_retrieve_subdata(data,fund,enddate,window,unit);
end
n=size(price,1);
w=1:n;
price_w=price.*w';
wavg=2*sum(price_w)/(n*(n+1));
end