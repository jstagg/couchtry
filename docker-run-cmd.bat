echo off

rem docker run -it -v "/D//DockerDataMounts//mongotryData":/mongodata --name mongodbtry -p 27017:27017 -d mongo

docker network create -d bridge my-bridge-network

docker run --name couchtry -p 5984:5984 -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=wheee -d couchtry:0.1

docker network connect my-bridge-network couchtry

rem -30-
