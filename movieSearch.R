#clear the environment
rm(list = ls())
#R code to connect with this public API - http://www.omdbapi.com
#install the packages - "http", "jasonlite"
install.packages("httr")
install.packages("jsonlite")
install.packages("svDialogs")
#load the library
library("httr")
library("jsonlite")
library("svDialogs")

#define the URL call and API's
baseURL = "http://www.omdbapi.com/"
APIKey = "#######"    #replace '#' with your api key
movieName=dlgInput("Enter a number", Sys.info()["user"])$res
#place the movieName for your search
callURL = paste(baseURL,"?","apikey","=", APIKey,"&","s=",movieName, sep="")
#call the url with GET method
get_Movie = GET(callURL)
get_Movie_text = content(get_Movie, "text")
#get the data and save the json file
get_Movie_json = fromJSON(get_Movie_text, flatten = TRUE)
#convert JSON to dataFrame
get_Movie_df = as.data.frame(get_Movie_json)
#videw the result
View(get_Movie_df)
