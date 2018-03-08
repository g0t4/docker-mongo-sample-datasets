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

### Tutorial 

```bash

# run two environments: (one with data and one without)
docker-compose up
# destroy when done:
docker-compose down

# build image with dataset: (`docker-compose up` will build the image too so this isn't necessary)
docker-compose build 
docker image ls mongo-sample-datasets:dev

# browse to rockmongo:
# http://localhost:8090 (empty)
# http://localhost:8091 (has sample data)

```

### Mongo commands to try on server with data

```bash
# 1. exec into container to use mongo shell:
docker-compose exec mongo_with_data bash
# alternatively to get into the empty mongo server:
docker-compose exec mongo_empty bash

# 2. run mongo shell:
mongo

```
```mongo

# 3. select database to work with 
use test;

# 4. filtering documents
db.restaurants.find({ "address.zipcode": "11215" });
# pretty print documents
db.restaurants.find({ "address.zipcode": "11215" }).pretty();
# projecting (mapping) a subset of fields
db.restaurants.find({ "address.zipcode": "11215" }, { "name": 1 });
# sorting documents
db.restaurants.find({ "address.zipcode": "11215" }, { "name": 1 }).sort({ "name": 1 });
# counting documents
db.restaurants.find({ "address.zipcode": "11215" }).count();

# 5. some docs to learn more:
# https://docs.mongodb.com/manual/reference/method/db.collection.find/

```