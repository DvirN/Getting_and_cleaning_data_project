library(reshape2)


##  READ DATA 

X_train <- read.table("X_train.txt")
Y_train <- read.table("Y_Train.txt")

X_test <- read.table("X_test.txt")
Y_test <- read.table("Y_test.txt")

subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")


## Merging Train and Test data sets with their respective subject (cbind)

train_with_lab_sub <- cbind(X_train, y_train, subject_train)
test_with_lab_sub <- cbind(X_test, y_test, subject_test)

## Merge the above created data sets to one (rbind)
all_data <- rbind(train_with_lab_sub, test_with_lab_sub)

##Changing col names

names(all_data) <- features$V2
names(all_data)[c(562,563)] <- c("label", "subject")

##Finding variables of mean OR std

##finding indices
var_names <- names(all_data)
mean_indices <- grepl("mean", tolower(var_names)) ## mean var indices
std_indices <- grepl("std", tolower(var_names)) ## std var indices
all_indices <- mean_indices | std_indices ## join either

## subseting to only std or mean variables + label (562) + subject (563)
mean_std_data <- all_data[, c(which(all_indices), 562, 563)]

##reading activity labels
activity_labels <- read.table("activity_labels.txt")
names(activity_labels) <- c("label", "label_name")

##Merging 
mean_std_lab_data <- merge(mean_std_data, activity_labels, by = "label", all = TRUE)

##Deleting label number (no longer needed, we have the label name)
mean_std_lab_data$label <- NULL

data_melt <- melt(mean_std_lab_data, id = c("subject","label_name"),measure.vars = c(names(mean_std_lab_data)[1:86]))

tidy_data <- dcast(data_melt, subject + label_name ~ variable, mean)

##Renaming tidy data variables names
tidy_names <- names(tidy_data)
tidy_names <- gsub("-", "_",tidy_names)
tidy_names <- gsub("Mag", "Magnitude",tidy_names)
tidy_names <- gsub("tGravity", "timeGravity", tidy_names)
tidy_names <- gsub("fBody", "FFT_Body", tidy_names)

names(tidy_data) <- tidy_names ## inserting the now renamed variables

write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)



