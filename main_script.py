import csv
from topsy_scraping import *

with open('Hinglish_words.csv', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
	for row in spamreader:
		t = get_tweets_by_query(', '.join(row), 10)
		for b in t:
			print b['content']
			with open('dataset.csv', 'a') as csvfile:
				spamwriter = csv.writer(csvfile, delimiter=' ', quotechar=, quoting=csv.QUOTE_MINIMAL)
				spamwriter.writerow(b['content'].encode('utf-8'))
        # print ', '.join(row)
