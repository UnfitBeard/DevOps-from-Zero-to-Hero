set -e
NAME="kubernetes-demo-api"

USERNAME="unfitbeard"

IMAGE="$USERNAME/$NAME:latest"

echo "Building docker image........."
docker build -t $IMAGE .

echo "Pushing image to dockerhub....."
docker push $IMAGE

echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

echo "Getting pods ...."
kubectl get pods 

echo "Getting Services"
kubectl get services

echo "Getting main service"
kubectl get service $NAME-service