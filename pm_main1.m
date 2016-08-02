%pm_main1.m
%Nicholas Orange
%Started: 2016_05_17

pname='InertialLabs401k';
data=pm_update_data1(pname);
metrics=pm_compute_metrics1(data,365*3);
score=pm_score_metrics1(metrics);

return1=pm_backtest_sp500(data,365*3);
return2=pm_backtest_avg(data,'all',365*3);
return3=pm_backtest_best1(data,365*3);

% for i=1:numel(metrics)
%     figure(101)
%     plot(1:100,metrics{i}.score)
%     hold on
%     line([1,100],[mean(metrics{i}.score),mean(metrics{i}.score)])
%     hold off
%     pause
% end

%Ordered list of metrics (18 total):
% 1) 1 day return
% 2) 2 day return (average)
% 3) 3 day return (average)
% 4) 4 day return (average)
% 5) 5 day return (average)
% 6) 1 week return (average)
% 7) 2 week return (average)
% 8) 1 month return (average)
% 9) 1 week polynomial (slope)
% 10) 1 week polynomial (curvature)
% 11) 2 week polynomial (slope)
% 12) 2 week polynomial (curvature)
% 13) 1 week SMA (slope)
% 14) 2 week SMA (slope)
% 15) 1 week WMA (slope)
% 16) 2 week WMA (slope)
% 17) EMA alpha=0.1 (slope)
% 18) EMA alpha=0.2 (slope)