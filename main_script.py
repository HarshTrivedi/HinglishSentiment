import csv
from topsy_scraping import *

with open('Hinglish_words.csv', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter=',', quotechar='|')
	for row in spamreader:
		t = get_tweets_by_query(row[0], 10)
		for b in t:
			print b['content'].encode('utf-8')
			with open('dataset.csv', 'a') as csvfile:
				spamwriter = csv.writer(csvfile)
				spamwriter.writerow([b['content'].encode('utf-8')])
        # print ', '.join(row)
