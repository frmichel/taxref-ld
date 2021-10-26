#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

# Environment variables
. ../env.sh

mkdir -p dumps/${DATASET_VERSION}

log=run_all.log
echo -n "" > $log


DATATYPE=biblio
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=interactions
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=locations
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=vernaculars
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=media
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json


DATATYPE=taxonomy
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=externalIds
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json


DATATYPE=status_types
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

DATATYPE=statuses
./query_${DATATYPE}.sh           $DATASET_VERSION      &>> $log
./import_${DATATYPE}.sh          $DATASET_VERSION $DB  &>> $log
tar cvfz dumps/${DATASET_VERSION}/taxref_${DATATYPE}.json.tgz  taxref_${DATATYPE}_${DATASET_VERSION}_*.json
rm -f taxref_${DATATYPE}_${DATASET_VERSION}_*.json

