%pm_interpolate_data1.m
%Nicholas Orange
%Started: 2016_05_18
%Last edited: 2016_05_19

%Interpolates missing data in between market days
%Creates list of market days

function data=pm_interpolate_data1(data)
if nargin<1
    error('Fund Data input required.')
end
num_funds=size(data,1);
for i=1:num_funds
    q=0;
    added_size=0;
    add_list=zeros(20000,1);
    while q+1<data{i}.num_entries+added_size
        q=q+1;
        if data{i}.date_num(q)>data{i}.date_num(q+1)+1
            date_num_insert=[data{i}.date_num(q)-1:-1:data{i}.date_num(q+1)+1]';
            insert_size=size(date_num_insert,1);
            date_str_insert=pm_convert_date(date_num_insert);
            price_insert=linspace(data{i}.price(q),data{i}.price(q+1),insert_size+2); %use (2:end-1)
            price_adj_insert=linspace(data{i}.price_adj(q),data{i}.price_adj(q+1),insert_size+2);
            %fprintf('Interpolate between rows %d and %d.  Insert %d dates (%s to %s)\n',q,q+1,insert_size,date_str_insert(1,:),date_str_insert(end,:))
            data{i}.date_num=[data{i}.date_num(1:q);date_num_insert;data{i}.date_num(q+1:end)];
            data{i}.date_str=[data{i}.date_str(1:q,:);date_str_insert;data{i}.date_str(q+1:end,:)];
            data{i}.price=[data{i}.price(1:q);price_insert(2:end-1)';data{i}.price(q+1:end)];
            data{i}.price_adj=[data{i}.price_adj(1:q);price_adj_insert(2:end-1)';data{i}.price_adj(q+1:end)];
            add_list(q+1:q+insert_size)=ones(insert_size,1);
            q=q+insert_size;
            added_size=added_size+insert_size;
        end
    end
    data{i}.num_entries=size(data{i}.price,1);
    data{i}.market_days=~add_list(1:data{i}.num_entries);
end
        