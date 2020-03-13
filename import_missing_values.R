missingVals <- sum(baseDataNA)
missingVals

# new dataset
baseData2 <- baseData
# NA's in dataset
# dataset minus NA's for Mean calculation
NABase2 <- baseData2[is.na(baseData2$steps),]
cleanBase2 <- baseData2[!is.na(baseData2$steps),]

# generate Mean Data2 by interval
MeanData2ByInterval <- aggregate(cleanBase2$steps, by=list(cleanBase2$interval), sum)
names(MeanData2ByInterval)[1] ="interval"
names(MeanData2ByInterval)[2] ="steps"

# IMPUT METHOD- ATTEMPT 2
baseData2 <- baseData
missingData <- is.na(baseData2$steps)
meanVals <- tapply(cleanBase$steps, cleanBase$interval, mean, na.rm=TRUE, simplify=TRUE)
baseData2$steps[missingData] <- meanVals[as.character(baseData2$interval[missingData])]

#IMPUTE METHOD ATTEMPT 1.
# after trying the following code and messing with it for a few hours, and couldn't quite 
# get it right, i abandoned it for another path.  I expect the assignment was slightly off.
# intervals to match
#myCount <- 0
# loop through baseData2
#for (i in 1:nrow(baseData2)){
#  # if steps in current row is null act.
#  if (is.na(baseData2$steps[i])){
#    # match interval
#    for (j in 1:length(MeanData2ByInterval$interval)){
#      if (baseData2$interval[i]== MeanData2ByInterval$interval[j]){
#        baseData2$steps[i] <- as.integer(MeanData2ByInterval$steps[j])
#        myCount <- myCount + 1
#      }
#    }
#  }
#}
# values modified.
#myCount 

# original missing data count
sum(missingData)