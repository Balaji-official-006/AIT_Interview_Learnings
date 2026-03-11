# AIT_Interview_Learnings
# EKS Deployment using ECR Image

## 1 Create EKS Cluster

eksctl create cluster \
--name my-demo-cluster \
--region us-east-1 \
--nodegroup-name standard-nodes \
--node-type t3.small \
--nodes 2 \
--managed

---

## 2 Update kubeconfig

aws eks update-kubeconfig \
--region us-east-1 \
--name my-demo-cluster

---

## 3 Verify cluster

kubectl get nodes

---

## 4 Deploy application

kubectl apply -f deployment.yaml

---

## 5 Expose service

kubectl apply -f service.yaml

---

## 6 Verify resources

kubectl get pods
kubectl get svc

---

## 7 Get public URL

kubectl get svc nginx-service


## Important to check the Load balancer's Security group -is my IP white listed or not

