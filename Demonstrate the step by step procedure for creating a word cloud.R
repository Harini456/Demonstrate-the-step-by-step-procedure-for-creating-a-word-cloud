#Name: Harini G
#RollNo:2048034
#Lab:09

#install.packages("NLP")
#install.packages("tm")
#install.packages("RColorBrewer")
#install.packages("wordcloud")
#install.packages("wordcloud2")
library("NLP")
library("tm")
library("RColorBrewer")
library("wordcloud")
library("wordcloud2")

#to import the file type
filePath ="D:/Harini(christ unniversity)/2nd sem subjects/R/Donald Trump's Rallies at LasVegasFed21_2020.txt"

#Read lines in text_file using readLine() function.
#And storing text-data to modified text_file.
text_file = readLines(filePath)
text_file

#Now we are using paste() function in text_file and make it a chunk and the
#text collapse into quotations . And storing to text_file1.
text_file1 = paste(text_file, collapse = " ")
head(text_file1)

#The text mining function is used to convert the text to lower case,
#to remove unnecessary white space, to remove common stop words like 'the', 'we',
#to remove words, etc.
#Let us make text_file1 to lower case using tolower() function.
#And assign it to modified clean_text.

clean_text = tolower(text_file1)
#clean_text
head(clean_text)

#removeNumbers and removePunctuation arguments.
#To remove punctuations we are using gsub() function in the below code.
#Here, pattern= '\\W' to remove punctuations.
#Here, pattern= '\\d' to remove digits.
#replace= '_', we are going to replace the punctuations by space.
#If we dont do so then it may make new words.

clean_text1 = gsub(pattern = "\\W", replace = " ",clean_text)
head(clean_text1)
clean_text2 = gsub(pattern = "\\d", replace = " ", clean_text1)
head(clean_text2)

#stopwords() is near zero due to the fact that they are
#so common in a language.
stopwords()

#Lets us remove those stopwords and unnecessary words by using
#removeWords() function.
clean_text3 = removeWords(clean_text2,words = c(stopwords(),"ai","ab","abc"))
head(clean_text3)

#Now let us remove single letters, by gsub() function
clean_text4 = gsub(pattern = "\\b[A-z]\\b{1}", replace = " ", clean_text3 )
head(clean_text4)

#Here \\b[A-z] represents strings with any letter between a-z.
#The string can take uppercase letters as well as lower case letters
#and subset \\{1} says that the strings end with length one.
#We can finally remove white spaces using stripWhitespace() function,
#which is a part of tm library.
clean_text5 = stripWhitespace(clean_text4)
head(clean_text4)

#split-splitts individual words and add space between them as
#split using split() function.
clean_text6 = strsplit(clean_text5, " ")
head(clean_text6)

#Now create word_freq table and assign clean_text6 data in the
#table using table function.
word_freq = table(clean_text6)
word_freq

#By using cbind() by taking word_freq data-frame arguments and
#combine by columns or rows, respectively.
word_freq1 = cbind(names(word_freq), as.integer(word_freq))
word_freq1

# Generate the Word cloud
word_cloud = unlist(clean_text6)
word_cloud

wordcloud(word_cloud)

#wordcloud(word_cloud,min.freq = 5,random.order = FALSE,scale=c(3, 0.5))

wordcloud(word_cloud,min.freq = 3, max.words=500, random.order=T, rot.per=0.2,colors=brewer.pal(5, "Dark2"), scale=c(5,0.2))
#wordcloud2(word_freq)
wordcloud2(word_freq, color = "random-light", backgroundColor = "white")
