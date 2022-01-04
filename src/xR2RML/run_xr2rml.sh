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
JAR=$XR2RML/morph-xr2rml-dist-1.3.2-20211126.142114-3-jar-with-dependencies.jar


# Read input arguments
DATATYPE=$1
if [[ -z "$DATATYPE" ]] ; then help; fi

# --- Init log file
mkdir --p $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_xr2rml_${DATATYPE}.log
echo -n "" > $log

mappingFile=$XR2RML/xr2rml_${DATATYPE}.ttl
echo "-- xR2RML mapping file --" >> $log
cat $mappingFile >> $log

echo "--------------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx4g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$JAR" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile $mappingFile \
     --output Taxrefld_${DATATYPE}.ttl \
     >> $log

date >> $log
rm -f $XR2RML/xr2rml_${DATATYPE}.ttl
