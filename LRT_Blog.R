# This script is a general overview of likelihood ratio test (LRT)
# We're going to simulate a data set and compare the
# difference in means between two groups with a LRT


###################################################################################
###... Install any required packages that are not currently installed ----------
####################################################################################
# List required packages
adm.req <-c("ggplot2")

# Load currently installed, required packages
tmp <- lapply(adm.req, require, character.only = T)

# Find the required packages that still need to be installed
adm.need <- adm.req[!(paste0("package:",adm.req) %in% search())]

# Install required packages that are not currently installed
if(length(adm.need)>0){ install.packages(adm.need,dependencies=T) }

# Now, make sure all packages are loaded
tmp <- lapply(adm.req, require, character.only = T)

tmp
#################################################################################
# To simulate the data we have to designate how many different groups
# we have ('control' and 'treatment')
# And we also have to give our group levels some names
gr.levels<- c("control", "nutrient")

# Here were designating the number plant that we have
# size measurements (the same n for each group)
n<- 50

# and creating our factor variable 
x<- rep(gr.levels, each=n)
print(x[c(1:5, 50:55)])


# population means for each group (lets say units are in meters)
pop.mu<-c (0.1, 1.1)

# Creating a vector with the means that corresponds to 
# our group level variable (x)
means<- rep(pop.mu, each=n)
# inspecting the vectors (x) and means ()
print(cbind(x[c(1:5, 50:55)], means[c(1:5, 50:55)]))

# population variance (assuming variance across groups is equal)
sigma<- 1.3

# generating the random noise
error<- rnorm(n, 0, sigma)

# Creating 
# model matrix 
X<- as.matrix(model.matrix(~as.factor(x)-1))

# generating the data
y<- as.numeric(X %*% as.matrix(pop.mu)+error) # voila!

# Inspecting our vecotr of simulated data: note the difference in values
# between the first 5 observation for each group
print(cbind(x[c(1:5, 50:55)], y[c(1:5, 50:55)]))
################################################################
