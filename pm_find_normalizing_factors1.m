%pm_score_metrics1.m
%Nicholas Orange
%Started: 2016_07_16
%Last edited: 2016_07_16

%Computes statitics on each performance metric necessary to normalize each
%metric.

function nf=pm_find_normalizing_factors1(m)
if nargin<1
    error('Input of metrics structure is required!')
end
num_funds=numel(m);
sz=m{1}.period;
superset=zeros(sz*num_funds,18); %18 is current number of metrics
for i=1:num_funds
    if m{i}.period~=sz
        error('Funds have inconsistent period!')
    end
    inds=(i-1)*sz+1:i*sz;
    superset(inds,1)=m{i}.ret_1day(:,2);
    superset(inds,2)=m{i}.ret_2day(:,2);
    superset(inds,3)=m{i}.ret_3day(:,2);
    superset(inds,4)=m{i}.ret_4day(:,2);
    superset(inds,5)=m{i}.ret_5day(:,2);
    superset(inds,6)=m{i}.ret_1week(:,2);
    superset(inds,7)=m{i}.ret_2week(:,2);
    superset(inds,8)=m{i}.ret_1month(:,2);
    superset(inds,9)=m{i}.poly_1week(:,1);
    superset(inds,10)=m{i}.poly_1week(:,2);
    superset(inds,11)=m{i}.poly_2week(:,1);
    superset(inds,12)=m{i}.poly_2week(:,2);
    superset(inds,13)=m{i}.sma_1week(:,2);
    superset(inds,14)=m{i}.sma_2week(:,2);
    superset(inds,15)=m{i}.wma_1week(:,2);
    superset(inds,16)=m{i}.wma_2week(:,2);
    superset(inds,17)=m{i}.ema1(:,2);
    superset(inds,18)=m{i}.ema2(:,2);
end
nf=[mean(superset);std(superset)]';
end