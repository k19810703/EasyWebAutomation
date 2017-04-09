#!/usr/bin/env bash
docker stop webautota_firefox
docker stop webautota_chrome
docker stop webautoui
docker stop webautodb
docker rm webautota_firefox
docker rm webautota_chrome
docker rm webautoui
docker rm webautodb
docker rmi webautota_firefox_image
docker rmi webautota_chrome_image
docker rmi webautouiimage
docker rmi webautodbimage
