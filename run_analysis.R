#load library dplyr
library(dplyr)
#import data tables
train_data <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
train_labels <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
test_labels <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
#merge datasets
merged_data<- rbind(train_data, test_data)
#read names
features <- read.table(file.choose(), header = FALSE)[, 2]
#choose features.txt
#extract mean and sd measurements
mean_std_indices<-grep("mean()|std()",features, ignore.case=TRUE)
mean_std_data<-merged_data[, mean_std_indices]
#read activity labels
activity_labels<-read.table(("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"))
activity_labels <- as.character(activity_labels)
merged_labels <- rbind(train_labels, test_labels)
activity_labels_data <- activity_labels[merged_labels$V1]
#clean and set descriptive variables names
cleaned_feature_names <- features[mean_std_indices]
cleaned_feature_names <- gsub("[()]", "", cleaned_feature_names)
cleaned_feature_names <- gsub("-", ".", cleaned_feature_names)
colnames(mean_std_data) <- cleaned_feature_names
#create tidy dataset
train_subject <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
test_subject <- read.table("C:/Users/NielsvanderB_z0f34za/OneDrive - SeederDeBoer/Bureaublad/Training/R/Getting and cleaning data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
merged_subject <- rbind(train_subject, test_subject)
tidy_data <- cbind(Subject = merged_subject$V1, Activity = activity_labels_data, mean_std_data)
#calculate average of each variable
tidy_data_avg <- tidy_data %>%
  +     group_by(Subject, Activity) %>%
  +     summarise(across(everything(), mean))
#save
write.table(tidy_data_avg, file = "tidy_data_avg.txt", row.names = FALSE)