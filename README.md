Build the docker image:

```sh
docker build -t coral .
```

Run it:

```sh
docker run -it --rm           \
  -v $PWD/pycoral:/home/coral \
  --device /dev/bus/usb       \
  coral bash
```

Try it:

```sh
python3 examples/classify_image.py                                      \
  --model test_data/mobilenet_v2_1.0_224_inat_bird_quant_edgetpu.tflite \
  --labels test_data/inat_bird_labels.txt                               \
  --input test_data/parrot.jpg
```

Or just:

```sh
./check.sh
```

You can also use podman:

```sh
podman build -t coral .
```

```sh
podman run -it --rm           \
  -v $PWD/pycoral:/home/coral \
  --device /dev/bus/usb       \
  --group-add keep-groups     \
  coral bash
```
