# README

An experimental demo configuration of [OpenRefine](https://openrefine.org/). The objective of the demo is to run OpenRefine as a Workspace tool running in the Kubernetes back end used for Shiny & other Workspace tools.

Build the image:
```sh
docker build . -t openrefine:0.2
```

Run the image, mounting local folder and mapping local to container ports:
```sh
docker run -it -p 8080:8080 --volume ./data:/home/workspace/files/openrefine/data openrefine:0.2
```

## Acknowledgements

- The seed Dockerfile came from <https://github.com/opencultureconsulting/openrefine-docker/blob/master/3.4/Dockerfile>
