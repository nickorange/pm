%pm_run_puller.m
%Nicholas Orange
%Started: 2016_05_17
%Last edited: 2016_05_17

%Runs external puller3.py script
%Sets up fundlist filename in filename_for_fundlist.txt

function pm_run_puller(pname)
if nargin<1
    error('Portfolio Name input required.')
end
filepath_write=['./fundlist_',pname,'.csv'];
fileID=fopen('./filename_for_fundlist.txt','w');
fprintf(fileID,filepath_write);
fclose(fileID);
system('puller3.py');
end