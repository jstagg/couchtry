#!/bin/sh

# Import the data

curl -X PUT http://admin:wheee@localhost:5984/aliases

cat aliases.csv | couchimport --url http://admin:wheee@localhost:5984 --db aliases