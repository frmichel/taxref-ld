#!/bin/bash
# Input argument:
# - arg1: data type
# - arg2: TAXREF version
#
# Author: F. Michel, UCA, CNRS, Inria

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <data type> <TAXREF version>"
  echo "Call example:"
  echo "   $exe biblio 12.0"
  exit 1
}

XR2RML=$(pwd)

# Read input arguments
DATATYPE=$1
if [[ -z "$DATATYPE" ]] ; then help; fi

TAXREFVER=$2
if [[ -z "$TAXREFVER" ]] ; then help; fi

log=logs/run_xr2rml_${DATATYPE}.log
echo -n "" > $log

# Substitute placeholders
awk "{ gsub(/{{TAXREFVER}}/, \"$TAXREFVER\"); print }" $XR2RML/xr2rml_${DATATYPE}_tpl.ttl > $XR2RML/xr2rml_${DATATYPE}.ttl
echo "-- xR2RML mapping file --" >> $log
cat $XR2RML/xr2rml_${DATATYPE}.ttl >> $log

echo "--------------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx4g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$XR2RML/morph-xr2rml-dist-1.3.2-SNAPSHOT-jar-with-dependencies.jar" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile xr2rml_${DATATYPE}.ttl \
     --output Taxrefld_${DATATYPE}.ttl \
     >> $log

date >> $log
rm -f $XR2RML/xr2rml_${DATATYPE}.ttl
