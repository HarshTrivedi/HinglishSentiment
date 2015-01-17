import csv
import nltk.classify.util
import random
from nltk.classify import NaiveBayesClassifier
from nltk.corpus import movie_reviews
from nltk.classify import SklearnClassifier
from sklearn.naive_bayes import BernoulliNB
from sklearn.svm import SVC
from nltk.classify import DecisionTreeClassifier

def word_feats(words):
    return dict([(word, True) for word in words])

def emoti_feats( tweet , pos , neg , unknown):
	return { "pos_emot": int(pos) , "neg_emot": int(neg) , "unknown_emot": int(unknown) } 

def happy_expression_feats( tweet , expression_count):
	return { "happy_expression": int(expression_count) } 

def bigram_feats(tweet):
    bigramFeatureVector = {}
    for item in nltk.bigrams(tweet.split()):
        bigramFeatureVector[' '.join(item)] = True
    return bigramFeatureVector


def trigram_feats(tweet):
    trigramFeatureVector = {}
    for item in nltk.trigrams(tweet.split()):
        trigramFeatureVector[' '.join(item)] = True
    return trigramFeatureVector

neg_feat = []
pos_feat = []
neutral_feat = []

# pos = 0
# neg = 0
# neu = 0
with open('preprocessed_data.csv', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter=',')
	for row in spamreader:
		if (row[1] != "" or row[0] != ""):
			all_feats = dict(  word_feats(row[0].split()).items() + emoti_feats(row[0] , row[2] , row[3] , row[4]).items()  + happy_expression_feats( row[0] , row[5]).items()  +  bigram_feats(row[0]).items() )

			# all_feats = dict(  word_feats(row[0].split()).items()   )
			if int(row[1]) == 0:
				# neu += 1
				neutral_feat.append( (all_feats , 'neutral') ) 
			if int(row[1]) == 1:
				# pos += 1
				pos_feat.append( ( all_feats , 'pos') )
			if int(row[1]) == 2:
				# neg += 1
				neg_feat.append( ( all_feats , 'neg') )

# print pos
# print neg
# print neu

train = neg_feat + pos_feat + neutral_feat

accuracies = []
for x in range(10):
	random.shuffle(train)
	cutoff = len(train)*8/10
	trainfeats = train[:cutoff]
	testfeats = train[cutoff:]
	# print 'train on %d instances, test on %d instances' % (len(trainfeats), len(testfeats))
	# print 'train on %d instances, test on %d instances' % (len(trainfeats), len(testfeats))
	# print trainfeats 

	# classifier = SklearnClassifier(BernoulliNB()).train(trainfeats)
	# classifier = NaiveBayesClassifier.train(trainfeats)
	# classifier = DecisionTreeClassifier.train(trainfeats)
	classifier = SklearnClassifier(SVC()).train(trainfeats)


	accuracy = nltk.classify.util.accuracy(classifier, testfeats)
	accuracies.append(accuracy)
	print 'accuracy: %f' % (accuracy)
	# classifier.show_most_informative_features()


accuracies = map(float,accuracies)
print 'avg %.4f ' %(sum(accuracies)/len(accuracies)) 
print 'max %.4f' %(max(accuracies))


