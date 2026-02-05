# Where do you type code? 
# We normally type the code in two places: 1. The source editor 2. Console where the command execution occur. 

# Where is the output of the code? 
# The output of the code appears in console pane. 

# Where do plots show up? 
# Plots show up in the plots pane primarily in the right bottom side of the R studio. 

# What is a global environment? 
# Global environment is a place where your data objects, functions and variables used in the current session are stored.  

# How do you get help for a function through R studio? 
# You can get help for a function in R studio using question mark (?) operator. 

# What is an R function?
# In R, the fundamental unit of shareable code is the package. A package bundles together code, data, documentation, and tests, and is easy to share with others.

# What is the function? 
# A function accepts input arguments and produces the output by executing valid R commands. They accomplish a specific task. 

# How do you find the installed and loaded packages? 
# You the already installed packages in the packages pane in the bottom right of the R studio

# What is a working directory, and how do you find it? 
# The working directory is the default location where R will look for files you want to load and where it will put any files you want to save. 

# What is the relative file path and how is it different than an absolute file path? 
# A relative file path is the location of subdirectories or files relative to a working directory. It is usually better for transferring from one computer to another. it is more reproducible. 
# An absolute file path is the location of subdirectories or files from the root of your computer. It is not reproducible. 

# Explain the steps to start a new R project connected to a GitHub repository.
# In R studio, to start a new project: File> new project> version control>Git. In the repository URL, paste the URL of your new GitHub repository. 

# Please explain the different data classes and how they are similar and different from each other.
# Vector: A vector is a collection of values. It contains elements of the same type.To combine a list of items to a vector, use the c() function and separate the items by a comma. 
# Dataframe: Data displayed in a format as a table.It can have different types of data inside it. It can be numeric or character. 
# Matrix: it is a two dimentional data set with fixed number of columns and rows. 

# Complete all tasks in an R script and push it to GitHub.
# Create a vector named 'z' with the values 1 to 200
z<- 1:200
#o	Print the mean and standard deviation of z on the console
mean(z)
sd(z)
# o	Create a logical vector named zlog that is 'TRUE' for z values greater than 30 and 'FALSE' otherwise.
zlog <- z >30

# Make a dataframe with z and zlog as columns. Name the dataframe zdf
zdf <- data.frame(z,zlog)
#	Change the column names in your new dataframe to equal “zvec” and “zlogic”
colnames(zdf) <- c("zvec", "zlogic")
# Make a new column in your dataframe equal to zvec squared (i.e., z2). Call the new column zsquared. 
zdf$zsquared <- zdf$zvec^2
# Subset the dataframe with and without the subset() function to only include values of zsquared greater than 10 and less than 100
zdf_subset <- zdf[zdf$zsquared> 10 & zdf$zsquared <100,]
print(zdf_subset)
zdfsubset_function <-subset(zdf,zsquared >10 & zsquared <100)
print (zdfsubset_function)
#	Subset the zdf dataframe to only include the values on row 26
zdf_row26 <- zdf[26,]
print (zdf_row26)
# Subset the zdf dataframe to only include the values in the column zsquared in the 180th row.
zdf_zsquared_180 <- zdf$zsquared[180]
print (zdf_zsquared_180)

# Download the Tips.csv file from Canvas. Use the read.csv() function to read the data into R using a relative file path  and so that the missing values are properly coded. **Note the missing values are reported in the data as a period (i.e., “.”). How do you know the data were read correctly? 
getwd()
list.files()
tipsR <- read.csv("TipsR.csv", na.strings = ".") # relative file path 
str(tipsR) # this will tell us if the data is read correctly i.e., “.” Will appear as na. 




