#!/usr/bin/env bash
outputdir=$(pwd)"/output"
echo "outputdir was set to:"$outputdir
inputdir=$(pwd)"/input"
echo "input was set to:"$inputdir
modulename="ui"
containername="webautoui"
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

docker build -t $imagename ./ui/
if  docker images | grep -q $imagename ; then
    echo $modulename" image created"
    #自定义端口请自行更改80为指定的端口号
    docker run -it --name webautoui -v $outputdir:/usr/src/chanceauto/public/output -v $inputdir:/usr/src/chanceauto/public/input --link webautodb:mysqldocker -p 80:6001 -d webautouiimage
    if  docker ps -a | grep -q $containername ; then
        echo $modulename" container created"
    else
        echo "error: "$modulename" container was not created"
    fi
else
    echo "error: "$modulename" image was not created"
fi
