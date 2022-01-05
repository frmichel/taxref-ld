#!/bin/bash
# Input argument:
# - arg1: external DB name
# - arg2: predicate corresponding to the external DB id
# - arg3: output directory
#
# Author: F. Michel, UCA, CNRS, Inria

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <external DB name> <predicate> <output dir>"
  echo "Call example:"
  echo "   $exe AlgaeBase wdt:P1348 taxref13"
  exit 1
}

XR2RML=$(pwd)
JAR=$XR2RML/morph-xr2rml-dist-1.3.2-20211126.142114-3-jar-with-dependencies.jar
DATATYPE=externalIds_dbxref


# --- Read input arguments
EXTDBNAME=$1
if [[ -z "$EXTDBNAME" ]] ; then help; fi

WDTPROP=$2
if [[ -z "$WDTPROP" ]] ; then help; fi

output=$3
if [[ -z "$output" ]] ; then help; fi


# --- Init log file
mkdir -p $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_xr2rml_${DATATYPE}_${EXTDBNAME//[^[:alnum:]]/_}.log
echo -n "" > $log

# Substitute placeholders
mappingFile=$XR2RML/xr2rml_${DATATYPE}.ttl
awk "{ gsub(/{{EXTDBNAME}}/, \"$EXTDBNAME\"); gsub(/{{WDTPROP}}/, \"$WDTPROP\"); print }" $XR2RML/xr2rml_${DATATYPE}_tpl.ttl > $mappingFile
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
     --output $output/${DATATYPE}_${EXTDBNAME//[^[:alnum:]]/_}.ttl \
     >> $log
date >> $log

rm -f $mappingFile
