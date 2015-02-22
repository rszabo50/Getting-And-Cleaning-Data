
library(reshape2)

opath <- "."
dspath <- "./UCI HAR Dataset"
psep <- "/"


# read in the feature labels
features <- read.table(paste(dspath,"features.txt",sep=psep),col.names=c("feature_id","feature_name"))

# Load the test data
test_results <- read.table(paste(dspath,"test","X_test.txt",sep=psep), col.names=(features[,2]))

# load the training data
training_results <- read.table(paste(dspath,"train","X_train.txt",sep=psep), col.names=(features[,2]))

# merge the results into a single data frame
merged_results <- rbind(
    cbind(
        read.table(paste(dspath,"test","subject_test.txt",sep=psep),col.names=c("subject_id")),
        read.table(paste(dspath,"test","y_test.txt",sep=psep),col.names=c("activity_id")),
        test_results
        ),
    cbind(
        read.table(paste(dspath,"train","subject_train.txt",sep=psep),col.names=c("subject_id")),
        read.table(paste(dspath,"train","y_train.txt",sep=psep),col.names=c("activity_id")),
        training_results
      )
    )


#remove the unwanted columns
cols <- c(c(1,2), grep("-mean|-std",names(merged_results)))
merged_results <- merged_results[,cols]
View(head(merged_results, n=30))

# represent our data in long form using the melt reshape command. eg. break each observation into a row using the subject_id, activity_id,activity name
molten_results <- melt(merged_results,id=c("subject_id", "activity_id"))
#View(head(molten_results[with(molten_results, order(subject_id, activity_id)), ],n=30))

# re-represent our data in wide format by key variables 
mean_results <- dcast(molten_results,subject_id + activity_id  ~ variable, mean)
# re-order it to make it easier to vew the data and tell if we are happy with te output

# read in the activity labels
activities <- read.table(paste(dspath,"activity_labels.txt",sep=psep),col.names=c("activity_id","activity_name"))
#add the activity string
mean_results <- merge(activities,mean_results,by.x="activity_id",by.y="activity_id",all=TRUE)
#View(head(mean_results,n=30))


mean_results <- mean_results[with(mean_results, order(subject_id, activity_id)), ]

drops <- c("activity_id")
mean_results <- mean_results[,!(names(mean_results) %in% drops)]
cols <- c(c(2,1), grep("mean|std",names(mean_results)))
mean_results <- mean_results[,cols]
View(head(mean_results,n=30))

#write the data to file, and exclude the row.names as per the requirement
write.table(mean_results,paste(opath,"tidied_human_movement_data.txt",sep=psep) , row.names=FALSE)

