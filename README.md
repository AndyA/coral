Build the docker image:

```sh
docker build -t coral .
```

Run it

```sh
docker run -it --rm --device /dev/bus/usb:/dev/bus/usb coral bash
```
