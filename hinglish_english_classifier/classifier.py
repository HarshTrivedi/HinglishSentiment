# -*- coding: utf-8 -*-
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

# def emoti_feats( tweet , pos , neg , unknown):
# 	return { "pos_emot": int(pos) , "neg_emot": int(neg) , "unknown_emot": int(unknown) } 

# def happy_expression_feats( tweet , expression_count):
# 	return { "happy_expression": int(expression_count) } 

# def bigram_feats(tweet):
#     bigramFeatureVector = {}
#     for item in nltk.bigrams(tweet.split()):
#         bigramFeatureVector[' '.join(item)] = True
#     return bigramFeatureVector


# def trigram_feats(tweet):
#     trigramFeatureVector = {}
#     for item in nltk.trigrams(tweet.split()):
#         trigramFeatureVector[' '.join(item)] = True
#     return trigramFeatureVector

hing_feat = []
eng_feat = []
other_feat = []

eng = 0
hing = 0
other = 0

with open('tagged_hinglish_english_data.csv', 'rb') as csvfile:
	spamreader = csv.reader(csvfile, delimiter=',')
	for row in spamreader:
			all_feats = dict(  word_feats(row[0].split()).items()  )
			if int(row[1]) == 0:
				eng += 1
				eng_feat.append( ( all_feats , 'English') )
			if int(row[1]) == 1:
				hing += 1
				hing_feat.append( ( all_feats , 'Hinglish') )
			if int(row[1]) == 2:
				other += 1
				other_feat.append( ( all_feats , 'Other') )
print eng
print hing
print other

train = eng_feat + hing_feat + other_feat

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
	classifier = NaiveBayesClassifier.train(trainfeats)
	# classifier = DecisionTreeClassifier.train(trainfeats)
	# classifier = SklearnClassifier(SVC()).train(trainfeats)

	# algorithm = nltk.classify.MaxentClassifier.ALGORITHMS[1]
	# classifier = nltk.MaxentClassifier.train(trainfeats, algorithm)


	accuracy = nltk.classify.util.accuracy(classifier, testfeats)
	accuracies.append(accuracy)
	print 'accuracy: %f' % (accuracy)
	# classifier.show_most_informative_features()


accuracies = map(float,accuracies)
print 'avg %.4f ' %(sum(accuracies)/len(accuracies)) 
print 'max %.4f' %(max(accuracies))


#####################################################
#check individual 'strings'

# classifier = NaiveBayesClassifier.train(train)
# classifier = SklearnClassifier(SVC()).train(train)

# test_feats = dict(  word_feats( "Meri class mai larkiyaan nahi hain thori bhejdo :p".split() ).items()  )  
# print( classifier.classify( test_feats )	)

# dist = classifier.prob_classify(test_feats)
# for label in dist.samples():
#     print("%s: %f" % (label, dist.prob(label)))


