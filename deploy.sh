echo "Starting to deploy docker image.."
DOCKER_IMAGE=jalalazhmatkhan/sistem-akademik
docker pull $DOCKER_IMAGE
docker ps -q --filter ancestor=$DOCKER_IMAGE | xargs -r docker stop
docker run -d -p 8085:8085 $DOCKER_IMAGE