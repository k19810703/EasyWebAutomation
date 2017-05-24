#!/usr/bin/env bash
browser=$1
browser_containername=$(echo ${browser} | tr '[A-Z]' '[a-z]')
agentname=$2
chrome="Chrome"
firefox="Firefox"
createcontaineronly="false"
autoagent="false"

if [ ! $1 ];  then
    echo "please add parameter 1 as Chrome or Firefox";
    exit 1;
fi

if [ ! $2 ];  then
    echo "please add parameter 2 as test agent name";
    exit 1;
fi

if [ ${agentname} == 'cloud_agent1' ] ; then
    autoagent=true
elif [ ${agentname} == 'cloud_agent2' ] ;then
    autoagent='true'
    echo "auto execute agent will be created"
else
    autoagent='false'
    echo "manual execute agent will be created"
fi

if [ ! $3 ];  then
    createcontaineronly="false"
    echo "build and start"
else
    createcontaineronly="true"
    echo "start only"
fi



#如果要使用vnc桌面，放开myport2的注释
#如果要使用grip模式，放开myport1的注释
if [ ${browser} == 'Firefox' ]; then
    echo "processing for Firefox";
#    myport1=4444
#    myport2=5901
elif [ ${browser} == 'Chrome' ]; then
    echo "processing for Chrome";
#    myport1=4445
#    myport2=5902
else
    echo "please use Chrome or Firefox as parameter";
    exit 1;
fi


outputdir=$(pwd)"/output"
echo "outputdir was set to:"${outputdir}
inputdir=$(pwd)"/input"
echo "input was set to:"${inputdir}
modulename="test agent "${browser_containername}
containername=${browser_containername}"_"${agentname}
echo "containername:"${containername}
imagename="webautota_"${browser_containername}"_image"
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
    if [ ${createcontaineronly} == 'false' ]; then
        echo ${modulename}" image exist";
        docker rmi ${imagename}
        echo ${modulename}" image deleted"
        docker build -t ${imagename} --file ./testagent/Dockerfile_${browser} --no-cache .
    fi
else
    echo ${modulename}" image does not exist";
    docker build -t ${imagename} --file ./testagent/Dockerfile_${browser} --no-cache .
fi


if  docker images | grep -q ${imagename} ; then
    echo "test agent image created"
    #如果要使用grid模式，加上-p ${myport1}:4444 映射4444端口
    #如果要使用vnc桌面，加上-p ${myport2}:5900 映射4444端口　
#    docker run --name ${containername} -d -p ${myport1}:4444 -p ${myport2}:5900 -v ${outputdir}:/usr/src/output -v ${inputdir}:/usr/src/input --link webautodb:mysqldocker ${imagename}
    docker run --name ${containername} -d -e "agentname=${agentname}" -e "testbrowser=${browser}" -v ${outputdir}:/usr/src/output -v ${inputdir}:/usr/src/input --link webautodb:mysqldocker ${imagename}
    if  docker ps -a | grep -q ${containername} ; then
        echo "test agent container created"
        if [ ${autoagent} == 'true' ]; then
            sleep 5
            docker exec -d ${containername} bash /usr/src/selfexecute.sh
            echo "lisenning shell started"
        fi
    else
        echo "error: test agent container was not created"
    fi
else
    echo "error: test agent image was not created";
fi