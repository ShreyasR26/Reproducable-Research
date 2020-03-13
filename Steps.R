# aggregate clean non NA steps per day (SUM)
SummedDataByDay <- aggregate(baseData$steps, by=list(baseData$date), sum)
# adjust column names
names(SummedDataByDay)[1] ="date"
names(SummedDataByDay)[2] ="totalsteps"
# top 15 of Summed Steps by day
head(SummedDataByDay,15)