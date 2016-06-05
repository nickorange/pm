%pm_main1.m
%Nicholas Orange
%Started: 2016_05_17

pname='InertialLabs401k';
data=pm_update_data1(pname);
metric=pm_compute_metrics1(data,60);
%out1=pm_cal_polyfit1(data,6,1,30);