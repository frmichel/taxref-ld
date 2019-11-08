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
size=5000
limit=30000

while [ "$start" -lt "$limit" ]
do
  echo "Retrieving page $page ($size entries starting at $start)..."
    curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_biblio_${TAXREFVER}_${start}.json \
         -X GET "https://taxref.mnhn.fr/api/sources?page=${page}&size=${size}"
     start=$(($start + $size))
     page=$(($page + 1))
done
