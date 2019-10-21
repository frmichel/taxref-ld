#!/bin/bash
# Import TAXREF STATUS TYPES into MongoDB

version=12.0
db=taxrefv12
collection=statusTypes

mongo --eval "db.${collection}.drop()" localhost/$db

FILE=taxref_status_types_${version}.json
echo "Processing $FILE"

awk -f import_status_types.awk $FILE > ${FILE}.tmp
mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
rm -f ${FILE}.tmp

mongo --eval "db.${collection}.createIndex({name: 1})" localhost/$db
