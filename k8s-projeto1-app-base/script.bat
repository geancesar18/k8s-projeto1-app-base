echo "Criando as imagens....."

docker build -t geancesar/projeto-backend:1.0 beckend/.
docker build -t geancesar/projeto-database:1.0 database/.

echo "Realizando o push das imagens....."

docker push docker build -t geancesar/projeto-backend:1.0
docker push docker build -t geancesar/projeto-database:1.0

echo "Criando serviços no cluster kubernets"

kubectl apply -f ./services.yml

echo "Criando o deployments.."

kubectl apply - ./deployment.yml