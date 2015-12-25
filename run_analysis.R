library(dplyr)


##  READ DATA 

X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_Train.txt")

X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")

features <- read.table("features.txt")


## Merging Train and Test data sets with their each other and with the respective subject (columns bind)

train_with_lab_sub <- cbind(X_train, Y_train, subject_train)
test_with_lab_sub <- cbind(X_test, Y_test, subject_test)

## Merge the above created data sets to one (rows bind)
all_data <- rbind(train_with_lab_sub, test_with_lab_sub)

##Changing columns names

names(all_data) <- make.names(features$V2) ## Give variabels infomrative and 'legal' names from the features txt file
names(all_data)[c(562,563)] <- c("label", "subject") ##name the label and subject columns

##Finding variables of mean OR std

##finding their indices

var_names <- names(all_data)
mean_indices <- grepl("mean", tolower(var_names)) ## mean var indices
std_indices <- grepl("std", tolower(var_names)) ## std var indices
all_indices <- mean_indices | std_indices ## join EITHER

## subseting to only std or mean variables + label (562) + subject (563)
mean_std_data <- all_data[, c(which(all_indices), 562, 563)]

##reading activity labels
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("label", "label_name")

##Merging 
mean_std_lab_data <- merge(mean_std_data, activity_labels, by = "label", all = TRUE)

##Deleting label number (no longer needed, we have the label name)
mean_std_lab_data$label <- NULL

##Summarizing the data according to each subject + activity pair



grouped_data <- group_by(mean_std_lab_data, subject, label_name)
tidy_data <- summarize_each(grouped_data, funs(mean))

##Renaming tidy data variables names
tidy_names <- names(tidy_data)
tidy_names <- gsub("-", "_",tidy_names)
tidy_names <- gsub("Mag", "Magnitude",tidy_names)
tidy_names <- gsub("tGravity", "timeGravity", tidy_names)
tidy_names <- gsub("tBody", "timeBody", tidy_names)
tidy_names <- gsub("fBody", "FFT_Body", tidy_names)

names(tidy_data) <- tidy_names ## inserting the now renamed variables

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)

View(tidy_data)



