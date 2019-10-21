#!/bin/bash
# Import TAXREF SOURCES into MongoDB

version=12.0
db=taxrefv12
collection=vernaculars

mongo --eval "db.${collection}.drop()" localhost/$db

for FILE in `ls taxref_vernaculars_${version}_*.json`; do
    echo "Processing $FILE"

    awk -f import_vernaculars.awk $FILE > ${FILE}.tmp
    mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
    rm -f ${FILE}.tmp
done

mongo --eval "db.${collection}.createIndex({langageId: 1})" localhost/$db
