#!/bin/bash
# Input argument:
# - arg1: TAXREF version
# - arg2: external DB name
# - arg3: predicate corresponding to the external DB id
#
# Author: F. Michel, UCA, CNRS, Inria

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <TAXREF version> <external DB name> <predicate>"
  echo "Call example:"
  echo "   $exe 12.0 AlgaeBase wdt:P1348"
  exit 1
}

XR2RML=$HOME/TAXREF-LD/xR2RML_tpl
DATATYPE=externalIds_dbxref

# Read input arguments
TAXREFVER=$1
if [[ -z "$TAXREFVER" ]] ; then help; fi

EXTDBNAME=$2
if [[ -z "$EXTDBNAME" ]] ; then help; fi

WDTPROP=$3
if [[ -z "$WDTPROP" ]] ; then help; fi

log=logs/run_xr2rml_${DATATYPE}_${EXTDBNAME//[^[:alnum:]]/_}.log
echo -n "" > $log

    # Substitute placeholders
awk "{ gsub(/{{TAXREFVER}}/, \"$TAXREFVER\"); gsub(/{{EXTDBNAME}}/, \"$EXTDBNAME\"); gsub(/{{WDTPROP}}/, \"$WDTPROP\"); print }" $XR2RML/xr2rml_${DATATYPE}_tpl.ttl > $XR2RML/xr2rml_${DATATYPE}.ttl
echo "-- xR2RML mapping file --" >> $log
cat $XR2RML/xr2rml_${DATATYPE}.ttl >> $log

echo "--------------------------------------------------------------------------------------------" >> $log
date  >> $log
java -Xmx4g \
     -Dlog4j.configuration=file:$XR2RML/log4j.properties \
     -jar "$XR2RML/morph-xr2rml-dist-1.1-RC-jar-with-dependencies.jar" \
     --configDir $XR2RML \
     --configFile xr2rml.properties \
     --mappingFile xr2rml_${DATATYPE}.ttl \
     --output Taxrefld_${DATATYPE}_${EXTDBNAME//[^[:alnum:]]/_}.ttl \
     >> $log

date >> $log
rm -f $XR2RML/xr2rml_${DATATYPE}.ttl
