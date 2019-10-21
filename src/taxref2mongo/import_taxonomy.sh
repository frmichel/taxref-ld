#!/bin/bash
# Import TAXREF TAXONOMY into MongoDB

version=12.0
db=taxrefv12
collection=taxonomy

mongo --eval "db.${collection}.drop()" localhost/$db

for FILE in `ls taxref_taxonomy_${version}_*.json`; do
    echo "Processing $FILE"

    awk -f import_taxonomy.awk $FILE > ${FILE}.tmp
    mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
    rm -f ${FILE}.tmp
done

mongo --eval "db.${collection}.createIndex({id: 1})" localhost/$db
mongo --eval "db.${collection}.createIndex({referenceId: 1})" localhost/$db
mongo --eval "db.${collection}.createIndex({habitat: 1})" localhost/$db
