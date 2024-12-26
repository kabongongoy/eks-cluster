#!/bin/bash

kubectl-apply () {
  cd ../eks-resources/autoscaler-test
  kubectl delete -f .
  cd ../eks-resources/deployments
  kubectl apply -f .
  cd ../eks-resources/ingress/aws-alb-ingress
  kubectl apply -f .
  cd ../eks-resources/ingress/ingress-tls
  kubectl apply -f .
  cd ../eks-resources/ingress/nginx-ingress
  kubectl apply -f .
  cd ../eks-resources/lb-service
  kubectl apply -f .
  cd ../eks-resources/roles
  kubectl delete -f .

}

kubectl-delete () {
  cd ../eks-resources/autoscaler-test
  kubectl delete -f .
  cd ../eks-resources/deployments
  kubectl delete -f .
  cd ../eks-resources/ingress/aws-alb-ingress
  kubectl delete -f .
  cd ../eks-resources/ingress/ingress-tls
  kubectl delete -f .
  cd ../eks-resources/ingress/nginx-ingress
  kubectl delete -f .
  cd ../eks-resources/lb-service
  kubectl delete -f .
  cd ../eks-resources/roles

  cloud\eks-resources\roles
  kubectl delete -f .

}

plan () {
  cd ../infra
  terraform plan
  cd ../eks
  terraform plan
  cd  ../networking
  terraform plan
}

apply () {
  cd ../infra
  terraform apply
  cd ../eks
  terraform apply
  cd  ../networking
  terraform apply
}

destroy () {
  cd ../eks
  terraform destroy
  # cd  ../networking
  # terraform destroy
}



case "$1" in
  "plan") plan
  ;;
  "apply") apply
  ;;
  "destroy") destroy
  ;;
  "kubectl-apply") kubectl-apply
  ;;
  "kubectl-delete") kubectl-delete
