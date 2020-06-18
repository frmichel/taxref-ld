#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

TAXREFVER=13.0
DBNAME=taxrefv13

log=run_all.log
echo -n "" > $log

./query_biblio.sh           $TAXREFVER          &>> $log
./import_biblio.sh          $TAXREFVER $DBNAME  &>> $log

./query_interactions.sh     $TAXREFVER          &>> $log
./import_interactions.sh    $TAXREFVER $DBNAME  &>> $log

./query_locations.sh        $TAXREFVER          &>> $log
./import_locations.sh       $TAXREFVER $DBNAME  &>> $log

./query_vernaculars.sh      $TAXREFVER          &>> $log
./import_vernaculars.sh     $TAXREFVER $DBNAME  &>> $log



./query_taxonomy.sh         $TAXREFVER          &>> $log
./import_taxonomy.sh        $TAXREFVER $DBNAME  &>> $log

./query_externalIds.sh      $TAXREFVER          &>> $log
./import_externalIds.sh     $TAXREFVER $DBNAME  &>> $log



./query_status_types.sh     $TAXREFVER          &>> $log
./import_status_types.sh    $TAXREFVER $DBNAME  &>> $log

./query_statuses.sh         $TAXREFVER          &>> $log
./import_statuses.sh        $TAXREFVER $DBNAME  &>> $log
