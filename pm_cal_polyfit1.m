%pm_cal_polyfit1.m
%Nicholas Orange
%Started: 2016_06_04
%Last edited: 2016_06_04

%Fit a 2nd order polynomial over specified time period and outputs the
%ending curvature and slope

function [slp,crv]=pm_cal_polyfit1(data,fund,enddate,period,unit)
if nargin==1
    if ~isnumeric(data)
        error('If giving only one input, input must raw numeric data vector of price.')
    elseif size(data,1)<3
        error('Input data is too small.  Must have at least 2 values in vertical vector.')
    else
        y=data;
    end
elseif nargin<4
    error('Data, Fund, End Date, and Time Period are required inputs to retrieve price data.')
elseif nargin==4
    y=pm_retrieve_subdata(data,fund,enddate,period);
elseif nargin==5
    y=pm_retrieve_subdata(data,fund,enddate,period,unit);
end
x=(1:size(y,1))';
pf=polyfit(x,y,5);
y_poly=polyval(pf,x);
if 1
    figure(100)
    plot(x,y,'b')
    hold on
    plot(x,y_poly,'r')
    hold off
end
slp=1; %placeholders
crv=2;
end