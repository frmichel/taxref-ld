#!/bin/bash
# Input argument:
# - arg1: data type
#
# Author: F. Michel, UCA, CNRS, Inria

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <data type>"
  echo "Call example:"
  echo "   $exe biblio"
  exit 1
}

XR2RML=$(pwd)

# Read input arguments
DATATYPE=$1
if [[ -z "$DATATYPE" ]] ; then help; fi

log=logs/run_xr2rml_${DATATYPE}.log
echo -n "" > $log

# Substitute placeholders
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
