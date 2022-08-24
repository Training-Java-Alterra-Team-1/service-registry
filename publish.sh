echo "Starting to publish docker image.."
LOCAL_IMAGE = 'registry-sistem-akademik:0.0.1'
REPO_IMAGE = 'jalalazhmatkhan/sistem-akademik'
DOCKER_IMAGE=jalalazhmatkhan/sistem-akademik
docker tag $LOCAL_IMAGE $REPO_IMAGE
docker push $REPO_IMAGE