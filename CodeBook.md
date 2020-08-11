## This is the codebook for the Week 4 project.

##Background about the source data
The data used for this project comes from the University of Calfornia at Irvine. The data is collected from accelerometers from the Samsung Galaxy S smartphone.

The data for the project can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The zip file required to obtain the raw data can be found at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

In order to unzip the files and store the files in a directory, please
run the associated R scripts in the run_analysis.R file.

## To properly tidy this data set.

1) Two new ID and one type variables were created:"subjectID","activityID", and "activityType".
                        

2) Several new measurement variables were created in order to extract the measurement data of averages and std.dev based on activity and subject.
They include the following:
"timeBodyAccelerometer-mean()-X"                    
"timeBodyAccelerometer-mean()-Y"                    
"timeBodyAccelerometer-mean()-Z"                    
"timeBodyAccelerometer-std()-X"                     
"timeBodyAccelerometer-std()-Y"                     
"timeBodyAccelerometer-std()-Z"                     
"timeGravityAccelerometer-mean()-X"                 
"timeGravityAccelerometer-mean()-Y"                 
"timeGravityAccelerometer-mean()-Z"                 
"timeGravityAccelerometer-std()-X"                  
"timeGravityAccelerometer-std()-Y"                  
"timeGravityAccelerometer-std()-Z"                  
"timeBodyAccelerometerJerk-mean()-X"                
"timeBodyAccelerometerJerk-mean()-Y"                
"timeBodyAccelerometerJerk-mean()-Z"                
"timeBodyAccelerometerJerk-std()-X"                 
"timeBodyAccelerometerJerk-std()-Y"                 
"timeBodyAccelerometerJerk-std()-Z"                 
"timeBodyGyroscope-mean()-X"                        
"timeBodyGyroscope-mean()-Y"                        
"timeBodyGyroscope-mean()-Z"                        
"timeBodyGyroscope-std()-X"                         
"timeBodyGyroscope-std()-Y"                         
"timeBodyGyroscope-std()-Z"                         
"timeBodyGyroscopeJerk-mean()-X"                    
"timeBodyGyroscopeJerk-mean()-Y"                    
"timeBodyGyroscopeJerk-mean()-Z"                    
"timeBodyGyroscopeJerk-std()-X"                     
"timeBodyGyroscopeJerk-std()-Y"                     
"timeBodyGyroscopeJerk-std()-Z"                     
"timeBodyAccelerometerMagnitude-mean()"             
"timeGravityAccelerometerMagnitude-mean()"          
"timeBodyAccelerometerJerkMagnitude-mean()"         "timeBodyGyroscopeMagnitude-mean()"                 
"timeBodyGyroscopeJerkMagnitude-mean()"             "frequencyBodyAccelerometer-mean()-X"               
"frequencyBodyAccelerometer-mean()-Y"               
"frequencyBodyAccelerometer-mean()-Z"               
"frequencyBodyAccelerometer-std()-X"                
"frequencyBodyAccelerometer-std()-Y"                "frequencyBodyAccelerometer-std()-Z"                
"frequencyBodyAccelerometer-meanFreq()-X"           
"frequencyBodyAccelerometer-meanFreq()-Y"           
"frequencyBodyAccelerometer-meanFreq()-Z"           
"frequencyBodyAccelerometerJerk-mean()-X"           
"frequencyBodyAccelerometerJerk-mean()-Y"           
"frequencyBodyAccelerometerJerk-mean()-Z"           
"frequencyBodyAccelerometerJerk-std()-X"            
"frequencyBodyAccelerometerJerk-std()-Y"            
"frequencyBodyAccelerometerJerk-std()-Z"            
"frequencyBodyAccelerometerJerk-meanFreq()-X"       
"frequencyBodyAccelerometerJerk-meanFreq()-Y"       
"frequencyBodyAccelerometerJerk-meanFreq()-Z"       
"frequencyBodyGyroscope-mean()-X"                   "frequencyBodyGyroscope-mean()-Y"                   
"frequencyBodyGyroscope-mean()-Z"                   "frequencyBodyGyroscope-std()-X"                    
"frequencyBodyGyroscope-std()-Y"                    
"frequencyBodyGyroscope-std()-Z"                    
"frequencyBodyGyroscope-meanFreq()-X"               
"frequencyBodyGyroscope-meanFreq()-Y"               
"frequencyBodyGyroscope-meanFreq()-Z"               
"frequencyBodyAccelerometerMagnitude-mean()"        
"frequencyBodyAccelerometerMagnitude-meanFreq()"    
"frequencyBodyAccelerometerJerkMagnitude-mean()"    
"frequencyBodyAccelerometerJerkMagnitude-meanFreq()"
"frequencyBodyGyroscopeMagnitude-mean()"            
"frequencyBodyGyroscopeMagnitude-meanFreq()"        
"frequencyBodyGyroscopeJerkMagnitude-mean()"        
"frequencyBodyGyroscopeJerkMagnitude-meanFreq()"    