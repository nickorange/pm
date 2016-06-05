%pm_update_data1.m
%Nicholas Orange
%Started: 2016_05_17
%Last edited: 2016_05_31

%Handy function to quickly update all portfolio data
%Runs external puller.py script

function data=pm_update_data1(pname)
if nargin<1
    error('Portfolio Name input required.')
end
fprintf('Running puller3.py... ')
pm_run_puller(pname);
fprintf('Done.\nLoading data from pulled csv files... ')
data=pm_load_historical_data1(pname);
fprintf('Done.\nApplying interpolation... ')
data=pm_interpolate_data1(data);
fprintf('Done.\nSaving... ')
save_path=['./data_',pname,'/data_recent.mat'];
save(save_path,'data')
fprintf('Done.\nData update complete.\n\n')
end