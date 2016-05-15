MongoDB Server with Sample Datasets
=======================

This container loads a mongo server and imports sample datasets. Including:
- Restaurants [https://docs.mongodb.com/getting-started/shell/import-data/](https://docs.mongodb.com/getting-started/shell/import-data/)

You can either run this container standalone or you can have it import the datasets into an existing mongo server.

### Usage Instructions

Standalone:
``` bash
docker run -p 27017:27017 weshigbee/mongo-sample-datasets 
```

Load data into existing server:
``` bash
docker run --rm -e "MONGO_SERVER=mongo" -e "MONGO_DATABASE=res" mongo-sample-datasets
```

### Configuration

Name                              | Default         | Description
----------------------------------|-----------------|------------
`MONGO_SERVER`                    |``               | MongoDB server hostname or IP address. If this is blank then data is loaded into a locally running server. 
`MONGO_PORT`                      |`27017`          | Only used to load data into a remote server.
`MONGO_DATABASE`                  |`test`           | Load sample data into this database. 

