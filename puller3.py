#Nicholas Orange
#puller3.py
#Started: 2016_05_17
#Completed: 2016_05_17

#Tool to pull multiple ticker_symbols of stock data from Yahoo finance into individual CSV files
#Reads ticker_symbols from CSV file named inside filename_for_fundlist.txt
#Intended for Portfolio Manager project
#Quiet version of puller2.py

import urllib.request
import csv
import os.path
#import time

def get_filename_fundlist():
	with open("./filename_for_fundlist.txt") as txt_object1:
		str1=str(txt_object1.readlines())
		filename_fundlist=str1[2:len(str1)-2]
		return(filename_fundlist)

def make_url(ticker_symbol):
	base_url = "http://ichart.finance.yahoo.com/table.csv?s="
	return base_url + ticker_symbol

def make_filename_output(ticker_symbol,portfolio_name):
	directory = "./data_"
	if not os.path.exists(directory + portfolio_name):
		os.makedirs(directory + portfolio_name)
	return directory + portfolio_name + "/" + ticker_symbol + ".csv"

def pull_historical_data(ticker_symbol,portfolio_name):
	url_made=make_url(ticker_symbol)
	filename_output=make_filename_output(ticker_symbol,portfolio_name)
	urllib.request.urlretrieve(url_made,filename_output)
	message1 = "pull_historical_data has completed successfully."
	return message1
		
#print('Running puller3.py...\n')
#print("Loading funds list from: " + get_filename_fundlist())
with open(get_filename_fundlist()) as csv_object1:
	csv_object2 = csv.reader(csv_object1, delimiter=',')
	header = next(csv_object2)
	num_lines=int(header[0])
	portfolio_name=header[1]
	#print('Portfolio Name: ' + portfolio_name)
	#print('Number of funds to Pull: ' + str(num_lines) + '\n')
	for i in range(0, num_lines):
		ticker_symbol=next(csv_object2)[0]
		#print(ticker_symbol)
		message1=pull_historical_data(ticker_symbol,portfolio_name)
	
#print('\nPuller is completely done.')
#time.sleep(1)