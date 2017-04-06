#!/usr/bin/env bash
outputdir=$(pwd)"/output"
echo "outputdir was set to:"$outputdir
inputdir=$(pwd)"/input"
echo "input was set to:"$inputdir
modulename="test agent"
containername="webautotestagent"
echo "containername:"$containername
imagename=$containername"image"
echo "imagename:"$imagename

if  docker ps -a | grep -q $containername ; then
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

docker build -t $imagename ./testagent/
if  docker images | grep -q $imagename ; then
    echo "test agent image created"
    docker run --name $containername -d -p 4444:4444 -p 5901:5900 -v $outputdir:/usr/src/output -v $inputdir:/usr/src/input --link webautodb:mysqldocker $imagename
    if  docker ps -a | grep -q $containername ; then
        echo "test agent container created"
        sleep 5
        docker exec -d $containername bash /usr/src/selfexecute.sh
    else
        echo "error: test agent container was not created"
    fi
else
    echo "error: test agent image was not created"
fi

