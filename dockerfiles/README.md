# 1. Create the image

Use the following command in the docker folder:
```bash
docker build . --build-arg "START_IMG=icubteamcode/ubuntu2004mesa:master_sources" --tag "WHAT_EVER_NAME_YOU_WANT"
```

# 2. Using the docker
Follow the steps:

- Use the command on your docker host (host is the pc on which you run the docker):
```bash
docker run -rm -it --network host --privileged --env DISPLAY=${DISPLAY} --env XAUTHORITY=/root/.Xauthority --mount type=bind,source=${XAUTHORITY},target=/root/.Xauthority --mount type=bind,source=/tmp/.X11-unix,target=/tmp/.X11-unix --mount type=bind,source=${HOME}/.config/yarp,target=/root/.config/yarp --name ultrapython ultrapythonimg script-video.sh
```

- Execute on the Ultrapython board the command for starting the driver.
ie:
```bash
ssh root@10.0.1.233
/root/icubtech/yarp-device-ultrapython/ini;
/root/icubtech/install/bin/yarpdev --from lowultra.ini
```

- Press ENTER on your docker host

- To end press again ENTER on your docker host. All the GUI will be closed

# 3. Access to the docker

Use the command:
```bash
docker run -rm -it --network host --privileged --env DISPLAY=${DISPLAY} --env XAUTHORITY=/root/.Xauthority --mount type=bind,source=${XAUTHORITY},target=/root/.Xauthority --mount type=bind,source=/tmp/.X11-unix,target=/tmp/.X11-unix --mount type=bind,source=${HOME}/.config/yarp,target=/root/.config/yarp --name ultrapython ultrapythonimg bash
```






