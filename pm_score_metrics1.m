%pm_score_metrics1.m
%Nicholas Orange
%Started: 2016_06_11
%Last edited: 2016_08_02

%Calculates score from performance metrics using normalizing factors and weights

function score=pm_score_metrics1(m,nfactors,points_weight)
fprintf('***** Computing strength scores *****\n')
if nargin<1
    error('Input of metrics structure is required!')
elseif nargin<3
    fprintf('No scoring weights specified.  Getting defaults from pm_get_weights1... ')
    points_weight=pm_get_weights1;
    fprintf('Done.\n')
    if nargin<2
        fprintf('No normalizing factors specified.  Calculating... ')
        nfactors=pm_find_normalizing_factors1(m);
        fprintf('Done.\n')
    end
end
fprintf('Determining strength of performance... ')
num_funds=size(m,1);
sz=m{1}.period;
score=zeros(sz,num_funds);
for i=1:num_funds
    if m{i}.period~=sz
        error('Funds have inconsistent period!')
    end    
    for t=1:sz
        raw_scores=[m{i}.ret_1day(t,2);m{i}.ret_2day(t,2);m{i}.ret_3day(t,2);m{i}.ret_4day(t,2);...
            m{i}.ret_5day(t,2);m{i}.ret_1week(t,2);m{i}.ret_2week(t,2);m{i}.ret_1month(t,2);...
            m{i}.poly_1week(t,1);m{i}.poly_1week(t,2);m{i}.poly_2week(t,1);m{i}.poly_2week(t,2);...
            m{i}.sma_1week(t,2);m{i}.sma_2week(t,2);m{i}.wma_1week(t,2);m{i}.wma_2week(t,2);...
            m{i}.ema1(t,2);m{i}.ema2(t,2)];
        norm_scores=(raw_scores-nfactors(:,1))./nfactors(:,2);
        score(t,i)=sum(norm_scores.*points_weight)*(100/sum(points_weight));
    end
end
fprintf('Done.\n')
fprintf('Scoring is complete.\n\n')
end