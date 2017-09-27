file.path("P:/R/Week4/UCI HAR Dataset/train","X_train.csv")

##Loading all files
train_x <- read.table("P:/R/Week4/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")
train_y <- read.table("P:/R/Week4/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")
test_x <-  read.table("P:/R/Week4/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
test_y <-  read.table("P:/R/Week4/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
train_sub <- read.table("P:/R/Week4/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="")
test_sub <- read.table("P:/R/Week4/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="")
features <- read.table("P:/R/Week4/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
activity <- read.table("P:/R/Week4/UCI HAR Dataset/activity_labels.txt", quote="\"", comment.char="")
names(activity) <- c("labels","label_name")



##Join data files
all_data <- rbind(train_x,test_x)
names(all_data) <- features$V2 
all_labels <- rbind(train_y,test_y)
all_sub <- rbind(train_sub,test_sub)

##Assigning label names
full_set <- cbind(all_data,all_labels,all_sub)
names(full_set) <- c(names(all_data),"labels","subjects")
full_set2 <- merge(full_set,activity,by = "labels")


##Keeping only mean and SD variables
coltokeep <- c(grep("mean|std",names(all_data),value = TRUE),"labels","subjects","label_name")
meansd_data <- full_set2[,coltokeep]

require(dplyr)
summary <- meansd_data %>% group_by(label_name,subjects) %>% summarize_all(funs(mean))
