#!/bin/bash
# Doc: https://taxref.mnhn.fr/taxref-web/api/doc

taxref_version=12.0
api_version=1

page=1
start=0
size=10000
limit=782267

while [ "$start" -lt "$limit" ]
do
  echo "Retrieving page $page ($size entries starting at $start)..."
    curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_status_${taxref_version}_${start}.json \
         -X GET "https://taxref.mnhn.fr/api/taxa/status?page=${page}&size=${size}"
     start=$(($start + $size))
     page=$(($page + 1))
done