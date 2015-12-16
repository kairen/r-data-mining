library(arules)

# step 1.
# prepare data
a_list <- list(
  c("I1","I2","I5"),
  c("I2","I4"),
  c("I2","I3"),
  c("I1","I2","I4"),
  c("I1","I3"),
  c("I2","I3"),
  c("I1","I3"),
  c("I1","I2","I3","I5"),
  c("I1","I2","I3")
)

# set transaction names
names(a_list) <- paste("T",c(1:9), "00", sep = "")
a_list

# force data into transactions
table5_1 <- as(a_list, "transactions") # Force an Object to Belong to a Class >as (Object, Class)
table5_1

# step 2.
# analyze data
# generate level plots to visually inspect binary incidence matrices
image(table5_1) # result- Figure 1 Level plot
summary(table5_1)

# step 3.
# find 1-items (L1)
# provides the generic function itemFrequency and the frequency/support for all single items in an objects based on itemMatrix.
itemFrequency(table5_1, type = "relative") # default: "relative"
itemFrequency(table5_1, type = "absolute") # same as the textbook

# step 4.
# create an item frequency bar plot for inspecting the item frequency distribution for objects based on itemMatrix
itemFrequencyPlot(table5_1) # result- Figure 2 Item frequency bar plot

# step 5.
# mine association rules
# rules <- apriori(table5_1, parameter = list(supp = 0.5, conf = 0.9, target = "rules"))
rules<- apriori(table5_1) # Mine frequent itemsets, association rules or association hyperedges using the Apriori algorithm

# step 6.
# display results
inspect(table5_1) # display transactions
inspect(rules) # display association