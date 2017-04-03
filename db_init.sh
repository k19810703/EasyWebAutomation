#!/usr/bin/env bash

modulename="db"
containername="webautodb"
echo "containername:"$containername
imagename=$containername"image"
echo "imagename:"$imagename

if  docker ps -a | grep -q $imagename ; then
    echo $modulename" container exist";
    docker stop $containername
    echo $modulename" container stoped"
    docker rm $containername
    echo $modulename" container deleted"
else
    echo $modulename" container does not exist";
fi

if  docker images | grep -q $imagename ; then
    echo $modulename" image exist";
    docker rmi $imagename
    echo $modulename" image deleted"
else
    echo $modulename" image does not exist";
fi

docker build -t $imagename ./database/
if  docker images | grep -q $imagename ; then
    echo $modulename" image created"
    docker run --name $containername -e MYSQL_ROOT_PASSWORD=123456 -p 3307:3306 -d $imagename
    if  docker ps -a | grep -q $containername ; then
        echo $modulename" container created"
        sleep 30
        docker exec -it webautodb bash init.sh
    else
        echo "error: "$modulename" container was not created"
    fi
else
    echo "error: "$modulename" image was not created"
fi

