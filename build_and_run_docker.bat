@echo off

docker stop tiny-usb && docker rm tiny-usb
docker rmi tiny-usb_image
docker build -t tiny-usb_image .
docker run -d -it -v %cd%:/app --name tiny-usb tiny-usb_image
docker exec -it tiny-usb bash