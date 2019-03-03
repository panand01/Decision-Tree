data<-breastcancer
str(data)
suffle_data<-data[sample.int(569),]
training_data<-suffle_data[(1:455),]
test_data<-suffle_data[(456:569),]

require(rpart)
decision_tree<-rpart(diagnosis~radius_mean+texture_mean+perimeter_mean+area_mean+smoothness_mean+compactness_mean+concavity_mean,training_data)
require(rpart.plot)
rpart.plot(decision_tree)
text(decision_tree,use.n = TRUE)

test_pred<-predict(decision_tree,test_data)
accuracy<-table(test_pred,test_data$diagnosis)
print(accuracy)

#########################################

require(party)
decision_tree2<-ctree(diagnosis~radius_mean+texture_mean+perimeter_mean+area_mean+smoothness_mean+compactness_mean+concavity_mean,training_data)
decision_tree2
plot(decision_tree2)
test_pred2<-predict(decision_tree2,test_data)

accuracy<-table(predict(decision_tree2),training_data$diagnosis)
print(accuracy)

accuracy1<-table(test_pred2,test_data$diagnosis)
print(accuracy1)







