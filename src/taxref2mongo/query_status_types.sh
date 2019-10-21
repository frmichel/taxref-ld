#!/bin/bash
# Doc: https://taxref.mnhn.fr/taxref-web/api/doc

api_version=1.0

curl -H "Accept: application/hal+json;version=${api_version}" \
         -o taxref_status_types_${taxref_version}.json \
         -X GET "https://taxref.mnhn.fr/api/status/types"
