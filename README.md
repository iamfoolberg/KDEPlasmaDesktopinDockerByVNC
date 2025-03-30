# forked from https://github.com/nuntius-dev/KDEPlasmaDesktopinDocker
![图片](https://github.com/user-attachments/assets/030bec4a-eab6-4106-adfd-98166a163281)


# build
```
docker build -t kde-plasma-docker .
```
# test
```
mkdir -p /docker/data/kde/desktop
mkdir -p /docker/data/kde/vnc

docker run -d  \
  --privileged \
  --security-opt seccomp=unconfined \
  --device /dev/snd \
  -p 5901:5901 \
  -p 8080:8080 \
  -v /docker/data/kde/desktop:/root/Desktop \
  -v /docker/data/kde/vnc:/root/.vnc \
  --name kde-plasma-container kde-plasma-docker

#-v /home/berg/KDEPlasmaDesktopinDocker/start.sh:/root/start.sh \
```
