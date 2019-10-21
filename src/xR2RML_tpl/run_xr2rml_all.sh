#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

TAXREFVER=12.0

./run_xr2rml.sh biblio               $TAXREFVER
./run_xr2rml.sh externalIds_webpages $TAXREFVER
./run_xr2rml.sh externalIds_worms    $TAXREFVER
./run_xr2rml.sh interactions         $TAXREFVER
./run_xr2rml.sh locations            $TAXREFVER
./run_xr2rml.sh status_types         $TAXREFVER
./run_xr2rml.sh statuses             $TAXREFVER
./run_xr2rml.sh taxonomy_classes     $TAXREFVER
./run_xr2rml.sh taxonomy_concepts    $TAXREFVER
./run_xr2rml.sh vernaculars          $TAXREFVER

./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "AlgaeBase" "wdt:P1348"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Amphibian Species of the World" "wdt:P5354" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Avibase" "wdt:P2026" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "BirdLife" "wdt:P5257"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Cockroach\r Species File Online" "wdt:P6052" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Coreoidea Species File Online" "wdt:P6053" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "DORIS" "wdt:P4630" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "EPPO Global Database" "wdt:P3031" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Fauna Europaea" "wdt:P1895" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "FishBase" "wdt:P938" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "GBIF" "wdt:P846"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Global Invasive Species Database" "wdt:P5626" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "IPNI" "wdt:P961"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Index Fungorum" "wdt:P1391" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Index Hepaticarum" "wdt:P2794" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Mammal Species of the World" "wdt:P959"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Mantodea Species File Online" "wdt:P6055" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Mycobank" "wdt:P962" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Orthoptera Species File Online" "wdt:P6050" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "POWO" "wdt:P5037" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Phasmida Species File Online" "wdt:P4855" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Psyl'list" "wdt:P6376" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "SANDRE" "wdt:P1717" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "SeaLifeBase" "wdt:P6018" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "Systematic Catalog of Culicidae" "wdt:P6057"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "TROPICOS" "wdt:P960" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "The Global Lepidoptera Names Index" "wdt:P3064" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "The Plant List (TPL)" "wdt:P1070" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "The World Spider Catalog" "wdt:P3288" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "VASCAN" "wdt:P1745" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "WoRMS" "wdt:P850" 
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "World Checklist of Selected Plant Families (WCSP)" "wdt:P3591"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "ZooBank" "wdt:P1746"
./run_xr2rml_externalIds_dbxref.sh $TAXREFVER "International Committee on Taxonomy of Viruses" "wdt:P1076" 
