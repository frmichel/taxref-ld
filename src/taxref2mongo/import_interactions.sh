#!/bin/bash
# Import TAXREF INTERACTIONS into MongoDB

version=12.0
db=taxrefv12
collection=interactions

mongo --eval "db.${collection}.drop()" localhost/$db

for FILE in `ls taxref_interactions_${version}_*.json`; do
    echo "Processing $FILE"

    awk -f import_interactions.awk $FILE > ${FILE}.tmp
    mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
    rm -f ${FILE}.tmp
done

mongo --eval "db = db.getSiblingDB('test'); db.${collection}.createIndex( {relationId:1} )"
