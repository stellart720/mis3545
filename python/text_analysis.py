# -*- coding: utf-8 -*-
import nltk
from sklearn.feature_extraction.text import TfidfVectorizer
from nltk.sentiment.vader import SentimentIntensityAnalyzer

def Similarity_Test(text1, text2):
    '''
    text1, text2: two strings
    return: similarity score of the two strings
    '''
    #convert all the words of two books to a vector, except for the stop words
    vectorizer = TfidfVectorizer(stop_words= 'english')    
    tfidf = vectorizer.fit_transform([text1, text2])
    #multipe the vector by its transpose to get the Similarity score
    return ((tfidf * tfidf.T).A)[0,1]

def Sentiment_Analysis(text):
    score = SentimentIntensityAnalyzer().polarity_scores(text)
    #return the polarity score of the text
    return score

text1 = 'This book is great'
text2 = 'This is a great book'

similarity = Similarity_Test(text1,text2)
print(similarity)


score = Sentiment_Analysis(text1)

print(score)