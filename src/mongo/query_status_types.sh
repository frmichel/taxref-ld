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

api_version=1.0

echo "************** Querying status types API **************"
curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_status_types_${TAXREFVER}.json \
         -X GET "https://taxref.mnhn.fr/api/status/types"
