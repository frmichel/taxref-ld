#!/bin/bash
# Import TAXREF Statuses into MongoDB

version=12.0
db=taxrefv12
collection=statuses_raw

mongo --eval "db.${collection}.drop()" localhost/$db

for FILE in `ls taxref_status_${version}_*.json`; do
    echo "Processing $FILE"

    awk -f import_statuses.awk $FILE > ${FILE}.tmp
    mongoimport --db $db --collection $collection --type json --jsonArray --file ${FILE}.tmp
    rm -f ${FILE}.tmp
done

mongo --eval "db.${collection}.createIndex({statusTypeName: 1})" localhost/$db

# Add a field statusTypeCode to the status documents
mongo localhost/$db import_statuses.js
