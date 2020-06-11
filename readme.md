<p align="center"><img src="https://res.cloudinary.com/dtfbvvkyp/image/upload/v1566331377/laravel-logolockup-cmyk-red.svg" width="400"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## Build and Run App with Docker

docker build -t ciptahub/poms .

docker run -itd -p 8080:80 --name poms-app ciptahub/poms

## Push into dockerhub

login : docker login

push : docker push ciptahub/poms:latest

## run with docker compose

run : docker compose up -d or docker compose up -d --build

down : docker compose down -v

## HELM

install helm 

kubectl -n kube-system create serviceaccount tiller

kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller

kubectl patch deploy --namespace kube-system tiller-deploy -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'

helm init --service-account tiller

documentation : http://dockerlabs.collabnix.com/kubernetes/beginners/Installing-Nginx-Ingress-controller.html

## Deploy App into GCP

kubectl create deployment poms-app --image=docker.io/ciptahub/poms:latest

kubectl expose deployment poms-app --name poms-app-service --type NodePort --port 8080 --target-port 80

## Expose into Nginx Inggress

helm install stable/nginx-ingress --name poms

cd ./deploy && kubectl apply -f nginx-ingress-resources.yaml

## Install PHPMyAdmin

helm install --name phpmyadmin stable/phpmyadmin --set serviceType=LoadBalancer