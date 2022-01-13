#!/bin/bash
# Input argument:
# - arg1: datatype
# - arg2: xR2RML mapping file
# - arg3: output file name
#
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
#
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

help()
{
  exe=$(basename $0)
  echo "Usage: $exe <datatype> <xR2RML mapping> <output file name>"
  echo "Example:"
  echo "   $exe  biblio  xr2rml_biblio.ttl  taxref13/biblio.ttl"
  exit 1
}

XR2RML=$(pwd)
JAR=$XR2RML/morph-xr2rml-dist-1.3.2-20220112.165556-4-jar-with-dependencies.jar


# --- Read input arguments
datatype=$1
if [[ -z "$datatype" ]] ; then help; fi

mappingFile=$2
if [[ -z "$mappingFile" ]] ; then help; fi

output=$3
if [[ -z "$output" ]] ; then help; fi


# --- Init log file
mkdir -p $XR2RML/logs &> /dev/null
log=$XR2RML/logs/run_xr2rml_${datatype}.log
echo -n "" > $log

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
     --output $output \
     >> $log
date >> $log
