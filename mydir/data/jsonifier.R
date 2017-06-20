library("reshape2")

library("jsonlite")
library("stringr")


mydata = read.csv("C:\\Users\\tedo\\Desktop\\Book1.csv", header = TRUE)

myJson = ''
for(row in 1:10){
  for (col in 1:12){
    k = mydata[row, col]
    myJson = paste(myJson, ', [', as.character(col-1), ', ', as.character(row-1), ', ', as.character(k), ']')
    
    }
}

myJson = paste(myJson, ']')
myJsonLen = stringr::str_length(myJson)
result = paste('[', substr(myJson, 4, myJsonLen))

?substr
write.table(myJson, "C:\\Users\\tedo\\Desktop\\AYEG\\V2\\ayeg-master\\mydir\\jsondata.txt", sep="\t")
