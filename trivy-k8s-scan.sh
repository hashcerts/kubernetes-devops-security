############### trivy-k8s-scan.sh ############### 

#!/bin/bash


# *** need to delete the following two lines to run the trivy tests -- START *** 
echo "Trivy scan level stage"
exit 0;
# *** need to delete the following two lines to run the trivy tests -- FINISH *** 

echo $imageName #getting Image name from env variable

docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.17.2 -q image --exit-code 0 --severity LOW,MEDIUM,HIGH --light $imageName
docker run --rm -v $WORKSPACE:/root/.cache/ aquasec/trivy:0.17.2 -q image --exit-code 1 --severity CRITICAL --light $imageName

    # Trivy scan result processing
    exit_code=$?
    echo "Exit Code : $exit_code"

    # Check scan results
    if [[ ${exit_code} == 1 ]]; then
        echo "Image scanning failed. Vulnerabilities found"
        exit 1;
    else
        echo "Image scanning passed. No vulnerabilities found"
    fi;

############### trivy-k8s-scan.sh ############### 
