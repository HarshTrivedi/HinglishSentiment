"""
TopsyLib is an unofficial module that gives easy access to Topsy, a tweet-search-engine.
"""
import urllib
import json

def get_tweets_by_query(query, count=10):
    """A function that gets the tweets by a query."""
    Tweets=[]
    queryEncoded=urllib.quote(query)
    api_key = "09C43A9B270A470B8EB8F2946A9369F3"
    source=urllib.urlopen("http://otter.topsy.com/search.js?q=%s&type=tweet&offset=0&perpage=%s&window=realtime&apikey=%s" % (queryEncoded, count, api_key)).read()
    json_tree = json.loads(source)
    for tweetelement in json_tree["response"]["list"]:
        Tweets.append(tweetelement)
    return Tweets

def get_latest_tweets(count=10):
    """A function that gets the last tweets."""
    return get_tweets_by_query(".*?", count)
