%pm_retrieve_subdata.m
%Nicholas Orange
%Started: 2016_06_01
%Last edited: 2016_08_02

%Grabs desired ADJUSTED price data from data structure as per inputs
%Output is flipped to be date ascending (chronological)

function out=pm_retrieve_subdata(data,fund,enddate,window,unit)
if nargin<4
    error('Data, Fund, End Date, and Time Period are required inputs to retrieve price data.')
elseif nargin>4
    if ~ischar(unit)
        error('Unit must be specified as a string: ''days'', ''weeks'', ''months'' or ''years''')
    else
        if strcmp(unit,'day')||strcmp(unit,'days')
        elseif strcmp(unit,'week')||strcmp(unit,'weeks')
            window=window*7;
        elseif strcmp(unit,'month')||strcmp(unit,'months')
            window=window*30; %1 month = 30 days regardless of month            
        elseif strcmp(unit,'year')||strcmp(unit,'years')
            window=window*365;
        else
            error('Unit must be either: ''days'', ''weeks'', ''months'' or ''years''')
        end
    end
end
if ischar(fund)
    i=pm_find_ts_index(fund,data);
else
    i=fund;
end
if ischar(enddate)
    enddate_num=pm_convert_date(enddate);
    df=find(data{i}.date_num==enddate_num);
    if isempty(df)
        error('Date string cannot be found.  Data may not be recent enough.')
    end
else
    df=enddate;
end
di=df+window;
out=flipud(data{i}.price_adj(df:di));
end