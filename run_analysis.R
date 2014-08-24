
# 
# 
run_analysis = function() {
  # Merge the datasets
  mergedDataset = courseProjectCreateDataset()
  
  tidyDataset = mergedDataset; 
  
  # Write the tidy data on disk
  write.table(tidyDataset, file = "tidyDataset.txt", row.names = FALSE) 
}

# 
# 
courseProjectCreateDataset = function() {
  
  # Train set
  subject_train = read.table("train\\subject_train.txt");
  x_train = read.table("train\\x_train.txt");
  y_train = read.table("train\\y_train.txt");
  
  # Test set
  subject_test = read.table("test\\subject_test.txt");
  x_test = read.table("test\\x_test.txt");
  y_test = read.table("test\\y_test.txt");
  
  features = read.table("features.txt");
  
  # Merge the training sets
  trainingSet = cbind(subject_train, y_train, x_train)
  
  # Merge the test sets
  testSet = cbind(subject_test, y_test, x_test)
  
  # Join the training and the test dataset
  finalDataset = rbind(trainingSet, testSet)
  
  # Define the column names
  columnNames = c("Subject", "ActivityLabel", as.vector(features[, 2]))
  meanAndStdColumns = sort(c(1, 2, grep("-mean", columnNames), grep("-std", columnNames)), decreasing = FALSE)
  
  colnames(finalDataset) <- columnNames
  finalDataset = finalDataset[, meanAndStdColumns]
  
  activityLabels = read.table("activity_labels.txt")
  finalDataset = merge(x = activityLabels, y = finalDataset, by.x = "V1", by.y = "ActivityLabel")
  finalDataset
}
