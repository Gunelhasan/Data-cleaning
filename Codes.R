1. Import data "Data.Sheet1.csv"
2. Change name to "Data" and take click on use first war as header

#gsub is for replacing
3. data$X1 = gsub("__", "", data$X1)
   data$X1 = gsub("_", "", data$X1)
   data$X1 = gsub(" ", "", data$X1)

#new coloumn for extracting hour
4. data$saat = substr(data$X1,1,4)

5.  data$saat = gsub("[0-9]$", "", data$saat)
data$saat = gsub("S$", "", data$saat)
data$saat = gsub("T$", "", data$saat)
data$st = gsub("F$", "", data$saat)
data$saat = gsub("W$", "", data$saat)
data$saat = gsub("MM$", "M", data$saat)

# trim numbers and additional letters several times doing this 
6. data$X1 = gsub("^[0-9]", "", data$X1)
data$X1 = gsub("^[A-z]", "", data$X1)

7. data$X1 = gsub("th", "", data$X1)
data$X1 = gsub("rd", "", data$X1)
data$X1 = gsub("st", "", data$X1)
data$X1 = gsub("nd", "", data$X1)

8.> data$X1 = gsub("th", "", data$X1)
> data$X1 = gsub("rd", "", data$X1)
> data$X1 = gsub("st", "", data$X1)
> data$X1 = gsub("nd", "", data$X1)

#date extracting

library(lubridate)  ##for checking date formats 
data$tarix1 = dmy(data$tarix)
data$tarix = gsub("1$","",data$tarix)
> data$tarix = gsub("0$","",data$tarix)
> data$tarix = gsub("2$","",data$tarix)
> data$tarix = gsub("3$","",data$tarix)

#remove 3nd coloumn
data = data[-3]

#weekdays extracting
data$hefte = weekdays(data$tarix1)

#for checking missing values 
library(DataExplorer)
plot_missing(data)

#removes missing values 
data = na.omit(data)


