library("reshape2")
library("jsonlite")
library("stringr")

mydata = read.csv("C:\\Users\\tedo\\Desktop\\AYEG\\V2\\ayeg-master\\mydir\\data\\overdues.csv"
                    , header = TRUE)
jsonData = ''
for (col in 1:11){
  regionData = mydata[1, col]
  jsonData = paste('[', jsonData, regionData, ' = [', sep = '')
  for (row in 1:17) {
      spr = ''
      if(row == 2){
        spr = ','
      }
      spr2 = ','
      if(row == 17){
        spr2 = ''
      }
      jsonData = paste(jsonData, spr, '[', '\'', mydata[row, 1], '\', ', mydata[row, col], ']', spr2, sep='')
      if(row == 17){
        jsonData = paste(jsonData, '];\n')
      }
  }
}

write.table(jsonData, "C:\\Users\\tedo\\Desktop\\AYEG\\V2\\ayeg-master\\mydir\\jsondata2.txt", sep="\t")
