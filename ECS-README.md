# ECS Fargate Deployment

## 1 Create ECS Cluster

aws ecs create-cluster --cluster-name nginx-cluster

---

## 2 Register Task Definition

aws ecs register-task-definition \
--cli-input-json file://task-definition.json

---

## 3 Create Service

aws ecs create-service \
--cluster nginx-cluster \
--service-name nginx-service \
--task-definition nginx-task \
--desired-count 1 \
--launch-type FARGATE \
--network-configuration "awsvpcConfiguration={subnets=[subnet-xxxx],securityGroups=[sg-xxxx],assignPublicIp=ENABLED}"

---

## 4 Verify Service

aws ecs list-services --cluster nginx-cluster
