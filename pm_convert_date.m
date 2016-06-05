%pm_convert_date1.m
%Nicholas Orange
%Started: 2016_05_18
%Last edited: 2016_05_18

%Converts a date (format: YYYY-MM-DD) to an integer date number
%OR and integer date number to date string
%Can be a single date, a vector of date numbers, or a cell of date strings
%date_num 1 is 0000-01-01 as per Matlab standard

function date_out=pm_convert_date(date_in)
if nargin<1
    error('Please input a date number, vector of date numbers, date string, or array of date strings')
end
format='yyyy-mm-dd';
if iscell(date_in)||ischar(date_in)
    date_out=datenum(date_in,format);
elseif isa(date_in,'numeric')
    date_out=datestr(date_in,format);
else
    error('Unidentified input data type!  Must be single number, vector of numbers, single string, or cell set of strings.')
end
end