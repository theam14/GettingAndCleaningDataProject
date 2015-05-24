# Script which implement the project analysis presented at the Getting
# and Cleaning Data course.

# Main function, performing all analysis steps. The result is a tidy
# data set.
run_analysis <- function(src_dir = '.')
{
    suppressPackageStartupMessages(library('data.table', character.only = TRUE))
    
    # Read features and activities files
    
    features <- fread(paste(src_dir, "features.txt", sep = ""))
    activity_labels <- fread(paste(src_dir, "activity_labels.txt", sep = ""), 
                             header = F)
    
    setnames(features, 1:2, c("id", "description"))
    setnames(activity_labels, 1:2, c("id", "label"))
    
    # Read the test raw data
    test_data <- get_raw_data(features, activity_labels, src_dir, "test")
    
    # Read the train raw data
    train_data <- get_raw_data(features, activity_labels, src_dir, "train")

    # Merge test and train data
    raw_data <- rbind(test_data, train_data)
    
    # Create a data set with the columns of mean and std of each variable
    filter_raw_data <- 
        raw_data[, grep('mean__p__p__|std__p__p__|Subject.Id|Activity.Description' ,
                        colnames(raw_data)), 
                 with = F ]
    
    # Create a tidy data set with the means with each variable, grouped by 
    # the corresponding activity and subject
    result_data <- filter_raw_data[, lapply(.SD, mean), 
                                   by = list(Activity.Description, Subject.Id)]
    
    column_names <- colnames(result_data)
    
    column_names <- gsub("__p__p__", "", column_names)
    
    column_names <- sapply(column_names[3:length(column_names)], 
                           function(x) { 
                               paste(x, ".Average", sep = "") 
                           } )
    
    setnames(result_data, 3:dim(result_data)[2], column_names )
    
    result_data
}

# Read X and Y data files, generating a data table with contains the subject, 
# activity and variable measuments information
get_raw_data <- function(features, activity_labels, src_dir = '.', type_name)
{
    y <- fread(paste(src_dir, type_name, "/", "y_", type_name, ".txt", 
                     sep = ""), header = F)
    setnames(y, 1, "id")
    
    y[, description := { act_id <- (id);
                         reg <- activity_labels[act_id, ];
                         reg[[2]]
                       } ]
    
    x <- read.table(paste(src_dir, type_name, "/", "X_", type_name, 
                          ".txt", sep = ""), header = F)
    
    colnames(x) <- gsub("-", "_", gsub("\\(\\)", "__p__p__", features[[2]]))
    
    data <- data.table(x, keep.rownames = T)
    
    data[, Activity.Description := y$description]
    
    subject <- fread(paste(src_dir, type_name, "/", "subject_", type_name, 
                           ".txt", sep = ""))
    
    setnames(subject, 1, "id")
    
    data[, Subject.Id := subject$id]
    
    data
}