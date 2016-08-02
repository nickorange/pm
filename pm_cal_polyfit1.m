%pm_cal_polyfit1.m
%Nicholas Orange
%Started: 2016_06_04
%Last edited: 2016_06_08

%Fits a polynomial (order p_n) to price data
%Outputs the slope and curvature at last date and polynomial coefficients
%Optional price data look-up with pm_retrieve_subdata.m

function [stats,pf]=pm_cal_polyfit1(data,fund,enddate,period,unit)
if nargin==1
    if ~isnumeric(data)
        error('If giving only one input, input must raw numeric data vector of price.')
    elseif size(data,1)<5
        error('Input data is too small.  Must have at least 5 values in vertical vector.')
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
p_n=3; %Polynomial order of fit
x=(1:size(y,1))';
pf=polyfit(x,y,p_n);
dpf=polyder(pf);
slp=polyval(dpf,x(end));
ddpf=polyder(dpf);
crv=polyval(ddpf,x(end));
stats=[slp,crv];
if 0
    figure(100)
    plot(x,y,'b')
    hold on
    plot(x,polyval(pf,x),'r')
    hold off
    title('Polyfit of Price data')
    
    figure(101)
    plot(x,polyval(dpf,x))
    title('1st Derivative of Polyfit')
    
    figure(102)
    plot(x,polyval(ddpf,x))
    title('2nd Derivative of Polyfit')
    figure(100)
end
end