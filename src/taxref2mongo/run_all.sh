#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

TAXREFVER=14.0
DBNAME=taxrefv14

mkdir -p dumps/${TAXREFVER}

log=run_all.log
echo -n "" > $log


DATATYPE=biblio
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=interactions
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=locations
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=vernaculars
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=media
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json


DATATYPE=taxonomy
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=externalIds
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json


DATATYPE=status_types
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

DATATYPE=statuses
./query_${DATATYPE}.sh           $TAXREFVER          &>> $log
./import_${DATATYPE}.sh          $TAXREFVER $DBNAME  &>> $log
tar cvfz dumps/${TAXREFVER}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${TAXREFVER}_*.json
rm -f taxref_${DATATYPE}_${TAXREFVER}_*.json

