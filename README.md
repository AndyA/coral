Build the docker image:

```sh
docker build -t coral .
```

Run it

```sh
docker run -it --rm -v $PWD/pycoral:/home/pycoral --device /dev/bus/usb:/dev/bus/usb coral bash
```
