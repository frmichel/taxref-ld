#!/bin/bash
# Input argument: TAXREF version, e.g. "12.0"
#
# Author: F. Michel, UCA, CNRS, Inria
#
# API doc: https://taxref.mnhn.fr/taxref-web/api/doc

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <TAXREF version>"
  echo "Call example:"
  echo "   $exe 12.0"
  exit 1
}

TAXREFVER=$1
if [[ -z "$TAXREFVER" ]] ; then help; fi

api_version=1
page=1
start=0
size=2000
limit=0

echo "************** Querying interactions API **************"
echo "Retrieving page $page ($size entries starting at $start)..."
    curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_interactions_${TAXREFVER}_${start}.json \
         -X GET "https://taxref.mnhn.fr/api/interactions/search?page=${page}&size=${size}"

limit=$(jq 'getpath(["page","totalElements"])' taxref_interactions_${TAXREFVER}_${start}.json) 

echo -e "\ndownloading $limit elements\n"

start=$(($start + $size))
page=$(($page + 1))

while [ "$start" -lt "$limit" ]
do
    echo "Retrieving page $page ($size entries starting at $start)..."
    curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_interactions_${TAXREFVER}_${start}.json \
         -X GET "https://taxref.mnhn.fr/api/interactions/search?page=${page}&size=${size}"
     start=$(($start + $size))
     page=$(($page + 1))
done
