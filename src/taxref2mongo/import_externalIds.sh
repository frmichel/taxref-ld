#!/bin/bash
# Import TAXREF SOURCES into MongoDB

version=12.0
db=taxrefv12
collection=externalIds

mongo --eval "db.${collection}.drop()" localhost/$db

for FILE in `ls taxref_${collection}_${version}_*.json`; do
    echo "Processing $FILE"

    awk -f import_${collection}.awk $FILE > ${FILE}.tmp
    mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
    rm -f ${FILE}.tmp
done

mongo --eval "db.${collection}.createIndex({taxrefId: 1})" localhost/$db

# Add a field taxonReferenceId to the documents
mongo localhost/$db import_externalIds.js
