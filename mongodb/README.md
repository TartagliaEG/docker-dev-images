# Mongo Docker

##### About
The oficial mongodb image runs without any authentication enabled, so the [this custom entrypoint shell](./custom_entrypoint.sh) was made to enforce the --auth arg and to execute [this script](./first_mongo_run.js) on the first run. 
By default the [first\_mongo\_run.js](./first_mongo_run.js) script creates two accounts, the admin and the dev, but you could add any valid mongo command there. 

##### Dockerfile
The [Dockerfile](./Dockerfile) could be started with the following command:
```bash
# Build the image.
$ docker build . -t dev/mongo:1.0.0

# Runs the image, detaches it (-d), binds the port (-p) 27017, sets the name dev_mongo (--name) and sets the ./data folder as the container's data/db volume.
$ docker run -d -p 27017:27017 --name dev_mongo --rm -v /full/path/to/this/folder/data:/data/db dev/mongo:1.0.0
```


Acessing the mongo cli:
```bash
$ docker exec -it dev_mongo sh -c "mongo <?database> -u <?username> -p <?password> --port <?port>"

# Notice that the default port is 27017 and all mongo arguments are optional, so you could select the database (use <database>) and authenticate (db.auth('<uname>', '<pwd>') after estabilishing the connection with the mongo cli.
```

##### Notes
For more information about the official mongo image click [here](https://hub.docker.com/_/mongo/).

The custom entrypoint shell script was based on [this](https://github.com/frodenas/docker-mongodb).
