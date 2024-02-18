#!/bin/bash

commandoutput=$(docker ps -a | grep "sonarqube" -i)
echo $commandoutput

# first run this
for arg in $commandoutput
do
    $arg
    break
done

echo $arg

chmod 666 /var/run/docker.sock
docker ps -a | grep "sonarqube" -i
docker start $arg
docker ps -a | grep "sonarqube" -i

kubectl get all
kubectl get node -o wide
kubectl get po


##################### ALTERNATE METHOD ###################

#!/bin/bash

#psid=$(docker ps --format '{"ID":"{{ .ID }}", "Image": "{{ .Image }}", "Names":$
#echo $psid

#chmod 666 /var/run/docker.sock
#docker ps -a | grep "sonarqube" -i
#docker start $psid
#docker ps -a | grep "sonarqube" -i

#kubectl get all
#kubectl get node -o wide
#kubectl get po
