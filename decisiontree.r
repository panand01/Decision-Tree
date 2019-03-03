iris_new<-iris
suffle_data<-iris_new[sample.int(150),]
training_data<-suffle_data[(1:120),]
test_data<-suffle_data[(121:150),]
require(rpart)
decision_tree<-rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,training_data)
require(rpart.plot)
rpart.plot(decision_tree)
text(decision_tree,use.n = TRUE)
testpred<-predict(decision_tree,test_data)

accuracy_table<-table(predict(testpred),test_data$Species)
print(accuracy_table)

#############################################
require(party)
decision_tree2<-ctree(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,training_data)
plot(decision_tree2)
testpred2<-predict(decision_tree2,test_data)

accuracy_table2<-table(testpred2,test_data$Species)
print(accuracy_table2)

