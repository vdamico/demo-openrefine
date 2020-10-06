# README

An experimental demo configuration of [OpenRefine](https://openrefine.org/). The objective of the demo is to run OpenRefine as a Workspace tool running in the Kubernetes back end used for Shiny & other Workspace tools.

Build the image:
```sh
docker build . -t openrefine:0.6
```

For some `0.6` tag of you want to use

Run the image, mounting local folder and mapping local to container ports:
```sh
mkdir -p ./data
docker run -it -p 8080:8080\
     --volume ./data:/home/workspace\
     openrefine:0.6
```

## Acknowledgements

- The seed Dockerfile came from <https://github.com/OpenRefine/OpenRefine/releases/download/3.3/openrefine-linux-3.3.tar.gz>
