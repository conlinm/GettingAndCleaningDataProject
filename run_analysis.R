library(dplyr)
# Get the general files ready
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")

# Get the "test" df ready:
test <- read.table("X_test.txt")
testy <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt") 
testy <- left_join(testy, activity_labels, by = "V1") # add labels to the activities
test <- cbind(testy, test) # add the activities to the front of the df
test <- cbind(subject_test, test) # add the subjects to the front of df


# Get the "train" df ready
train <- read.table("X_train.txt")
trainy <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
trainy <- left_join(trainy, activity_labels, by = "V1") # add labels to the activities
train <- cbind(trainy, train) # add the activities to the front of the df
train <- cbind(subject_train, train) # add the subjects to the front of df


# now combine the two df
combined <- rbind(test, train)

#adding the variable names to the df
# first add the new three variable names to the top
V1 <- c(0.2, 0.4, 0.6)
V2 <- c("SubjectNumber", "ActivityCode", "ActivityName")
addedNames <- data_frame(V1, V2) # create the 2 X 3 df
features <- rbind(addedNames, features) # add to top of "features"
newNames <-  as.vector(features$V2) # extract just the names as a vector
validNewNames <- make.names(newNames, unique = T, allow_ = T) # had to make valid the names
names(combined) <- validNewNames # add variable names to "combined"

# Now select out the columns we are interested in, 
combined_f <- select(combined, SubjectNumber, ActivityName, matches("std()|mean()", ignore.case = TRUE))

# and clean up the names to make more sense, easier to read, and use standard r conventions
library(stringr)
better_names <- str_replace_all(names(combined_f), "\\.", " ")
better_names <- str_trim(better_names)
better_names <- str_replace_all(better_names, "   ", "_")
better_names <- str_replace_all(better_names, "  ", "_")
better_names <- str_replace_all(better_names, " ", "_")
better_names <- str_replace(better_names, "^t", "time_")
better_names <- str_replace(better_names, "^f", "frequency_")
better_names <- str_replace_all(better_names, "Body", "body_")
better_names <- str_replace_all(better_names, "Acc", "acceleration_")
better_names <- str_replace(better_names, "Gravity", "gravity_")
better_names <- str_replace(better_names, "gravity", "gravity_")
better_names <- str_replace(better_names, "__", "_")
better_names <- str_replace(better_names, "std", "standard_deviation")
better_names <- str_replace(better_names, "meanFreq", "mean_freq")
better_names <- str_replace(better_names, "SubjectNumber", "subject_number")
better_names <- str_replace(better_names, "ActivityName", "activity_name")
better_names <- tolower(better_names)
names(combined_f) <- better_names
#check for any "na"s
any(is.na(combined_f))

# now melt the data to be cast into the new tidy df we want with averages:
library(reshape2)
combined_melt <- melt(combined_f, id.vars = c("subject_number", "activity_name"), variable.name = "measurement")
tidy_means <- dcast(combined_melt, subject_number + activity_name ~ measurement, fun.aggregate = mean)
write.table(tidy_means, file = "conlin_tidy_means.txt", row.names = FALSE)
head(tidy_means)