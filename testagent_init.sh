#!/usr/bin/env bash
browser=$1
chrome="chrome"
firefox="firefox"

if [ ! $1 ];  then
    echo "please add parameter chrome or firefox";
    exit 1;
fi

if [ ${browser} == 'firefox' ]; then
    myport1=4444
    myport2=5901
elif [ ${browser} == 'chrome' ]; then
    myport1=4445
    myport2=5902
else
    echo "please use chrome or firefox as parameter";
    exit 1;
fi

echo ${myport1}
echo ${myport2}
mv ./testagent/Dockerfile_${browser} ./testagent/Dockerfile


outputdir=$(pwd)"/output"
echo "outputdir was set to:"${outputdir}
inputdir=$(pwd)"/input"
echo "input was set to:"${inputdir}
modulename="test agent "${browser}
containername="webautota_"${browser}
echo "containername:"${containername}
imagename=${containername}"_image"
echo "imagename:"${imagename}

if  docker ps -a | grep -q ${containername} ; then
    echo ${modulename}" container exist";
    docker stop ${containername}
    echo ${modulename}" container stoped"
    docker rm ${containername}
    echo ${modulename}" container deleted"
else
    echo ${modulename}" container does not exist";
fi

if  docker images | grep -q ${imagename} ; then
    echo ${modulename}" image exist";
    docker rmi ${imagename}
    echo ${modulename}" image deleted"
else
    echo ${modulename}" image does not exist";
fi

docker build -t ${imagename} ./testagent/
if  docker images | grep -q ${imagename} ; then
    echo "test agent image created"
    docker run --name ${containername} -d -p ${myport1}:4444 -p ${myport2}:5900 -v ${outputdir}:/usr/src/output -v ${inputdir}:/usr/src/input --link webautodb:mysqldocker ${imagename}
    if  docker ps -a | grep -q ${containername} ; then
        echo "test agent container created"
        sleep 5
        docker exec -d ${containername} bash /usr/src/selfexecute.sh
        echo "lisenning shell started"
    else
        echo "error: test agent container was not created"
    fi
else
    echo "error: test agent image was not created";
fi
mv ./testagent/Dockerfile ./testagent/Dockerfile_${browser}
