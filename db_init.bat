set modulename=db
set containername=webautodb
echo containername: %containername%
set imagename=%containername%image
echo imagename:%imagename%

docker ps -a | find %imagename%
if  error level 0 (
    echo %modulename% container exist
    docker stop %containername%
    echo %modulename% container stoped
    docker rm %containername%
    echo %modulename% container deleted
) else (
    echo %modulename% container does not exist
)

docker images | find %imagename%
if  error level 0  (
    echo %modulename% image exist
    docker rmi %imagename%
    echo %modulename% image deleted
) else (
    echo %modulename% image does not exist
)

docker build -t %imagename% ./database/
docker images | find %imagename%
if  error level 0 (
    echo %modulename% image created
    docker run --name %containername% -e MYSQL_ROOT_PASSWORD=123456 -p 3307:3306 -d %imagename%
    if  docker ps -a | grep -q %containername%  (
        echo %modulename% container created
        ping 127.0.0.1 -n 30 > nul
        docker exec -it webautodb bash init.sh
    ) else (
        echo error: %modulename%" container was not created
    )
) else (
    echo error: %modulename% image was not created
)

