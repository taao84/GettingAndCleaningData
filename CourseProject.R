# 
# 
courseProjectCreateDataset = function() {
  setwd("D:\\COURSES\\Getting and Cleaning Data\\Course Project\\UCI HAR Dataset")
  
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
  trainingSet = cbind(subject_train, x_train, y_train)
  
  # Merge the test sets
  testSet = cbind(subject_test, x_test, y_test)
  
  # Join the training and the test dataset
  finalDataset = rbind(trainingSet, testSet)
  
  rbind(c(as.integer(0), as.factor("Subject")), features, c(as.integer(562), as.factor("ActivityLabel")))
  
  columnNames = c("Subject", as.vector(features[, 2]), "ActivityLabel")
  colnames(finalDataset) = columnNames
  finalDataset
}
