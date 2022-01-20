#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

# Environment variables
. ../env.sh

# Directory where the output files are stored (relative to the current directory)
ODIR=$(pwd)/$DATASET_DIR
mkdir -p $ODIR

datatype=biblio
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=externalIds_webpages
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=externalIds_worms
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=habitats
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=interactions
./run_xr2rml.sh         $datatype  xr2rml_interactions_source_taxon.ttl  $ODIR/interactions_source_taxon.ttl
./run_xr2rml.sh         $datatype  xr2rml_interactions_target_taxon.ttl  $ODIR/interactions_target_taxon.ttl
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=locations
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=media
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=statuses
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=statusCodes
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=statusBiblio
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=taxonomy_classes
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=taxonomy_concepts
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

datatype=vernaculars
./run_xr2rml.sh         $datatype  xr2rml_${datatype}.ttl  $ODIR/${datatype}.ttl

./run_xr2rml_externalIds_dbxref.sh  "AlgaeBase"                       "wdt:P1348"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Avibase"                         "wdt:P2026"   $ODIR 
./run_xr2rml_externalIds_dbxref.sh  "BDTFX"                           "wdt:P3105"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Cockroach Species File Online"   "wdt:P6052"   $ODIR 
./run_xr2rml_externalIds_dbxref.sh  "DORIS"                           "wdt:P4630"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Fauna Europaea"                  "wdt:P1895"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "FishBase"                        "wdt:P938"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "GBIF"                            "wdt:P846"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Index Fungorum"                  "wdt:P1391"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "IPNI"                            "wdt:P961"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "IUCN Red List"                   "wdt:P627"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Mantodea Species File Online"    "wdt:P6055"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Orthoptera Species File Online"  "wdt:P6050"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Phasmida Species File Online"    "wdt:P4855"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "Psyl'list"                       "wdt:P6376"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "SANDRE"                          "wdt:P1717"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "The Plant List (TPL)"            "wdt:P1070"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "The World Spider Catalog"        "wdt:P3288"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "TROPICOS"                        "wdt:P960"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "VASCAN"                          "wdt:P1745"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "WFO (World Flora Online)"        "wdt:P7715"   $ODIR
./run_xr2rml_externalIds_dbxref.sh  "WoRMS"                           "wdt:P850"    $ODIR
./run_xr2rml_externalIds_dbxref.sh  "ZooBank"                         "wdt:P1746"   $ODIR

#./run_xr2rml_externalIds_dbxref.sh  "Amphipoda > WoRMS"               "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Ascidiacea > WoRMS"              "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Asteroidea > WoRMS"              "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Cetacea > WoRMS"                 "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Copepoda > WoRMS"                "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Cumacea > WoRMS"                 "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "DiatomBase > WoRMS"              "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Echinoidea > WoRMS"              "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Foraminifera > WoRMS"            "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Isopoda > WoRMS"                 "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Kinorhyncha > WoRMS"             "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Millibase > WoRMS"               "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "MolluscaBase > WoRMS"            "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Nemertea > WoRMS"                "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Ophiuroidea > WoRMS"             "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Polychaeta > WoRMS"              "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Porifera > WoRMS"                "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Pycnogonida > WoRMS"             "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "Scleractinia > WoRMS"            "wdt:P850"    $ODIR
#./run_xr2rml_externalIds_dbxref.sh  "NeMys: World Database of Nematodes > WoRMS" "wdt:P850"    $ODIR

# > db.externalIds.distinct("externalDbName").sort()

# ANTCAT
# AUBLET2
# AlgaeBase                                   AlgaeBase URL (P1348)
# Amphipoda > WoRMS                           WoRMS-ID for taxa (P850) 
# Aphid Species File
# Ascidiacea > WoRMS                          WoRMS-ID for taxa (P850) 
# Asteroidea > WoRMS                          WoRMS-ID for taxa (P850) 
# Avibase                                     Avibase ID (P2026) 
# BDTFX                                       Tela Botanica ID (P3105)
# BRYO_FR_FCBN
# CRUSTA
# Catalogue of Life
# Cetacea > WoRMS                             WoRMS-ID for taxa (P850) 
# Checklist of the Western Palaearctic Bees
# Cockroach Species File Online               Cockroach Species File ID (P6052) 
# Copepoda > WoRMS                            WoRMS-ID for taxa (P850) 
# Cumacea > WoRMS                             WoRMS-ID for taxa (P850) 
# DORIS                                       DORIS ID (P4630) 
# Dermaptera Species File Online
# DiatomBase > WoRMS                          WoRMS-ID for taxa (P850) 
# Echinoidea > WoRMS                          WoRMS-ID for taxa (P850) 
# Euro+Med Plantbase
# FAO
# FLORICAL
# Fauna Europaea                              Fauna Europaea ID (P1895) 
# FishBase                                    FishBase species ID (P938) 
# Foraminifera > WoRMS                        WoRMS-ID for taxa (P850) 
# GBIF                                        Global Biodiversity Information Facility ID (P846) 
# GRIN
# Global Biodiversity of Eumycetozoans
# IPNI                                        IPNI plant ID (P961) 
# ITIE
# ITM
# ITR
# IUCN Red List                               IUCN taxon ID (P627)
# Index Fungorum                              Index Fungorum ID (P1391) 
# Index Nominum Algarum
# Isopoda > WoRMS                             WoRMS-ID for taxa (P850) 
# Kinorhyncha > WoRMS                         WoRMS-ID for taxa (P850) 
# LIAS
# Mantodea Species File Online                Mantodea Species File ID (P6055) 
# Millibase > WoRMS                           WoRMS-ID for taxa (P850) 
# MolluscaBase > WoRMS                        WoRMS-ID for taxa (P850) 
# Nadeaud
# NeMys: World Database of Nematodes > WoRMS  WoRMS-ID for taxa (P850) 
# Nemertea > WoRMS                            WoRMS-ID for taxa (P850) 
# Ophiuroidea > WoRMS                         WoRMS-ID for taxa (P850) 
# Orthoptera Species File Online              OSF Online ID (P6050) 
# PESI
# Phasmida Species File Online                Phasmida Species File ID (P4855) 
# Plecoptera Species File Online
# Polychaeta > WoRMS                          WoRMS-ID for taxa (P850) 
# Porifera > WoRMS                            WoRMS-ID for taxa (P850) 
# Psyl'list                                   Psyl'list species ID (P6376) 
# Pycnogonida > WoRMS                         WoRMS-ID for taxa (P850) 
# Quadrige²
# SANDRE                                      SANDRE ID (P1717) 
# Scleractinia > WoRMS                        WoRMS-ID for taxa (P850) 
# Systema Dipterorum
# TROPICOS                                    Tropicos ID (P960) 
# Tardigrada > WoRMS                          WoRMS-ID for taxa (P850) 
# The Plant List (TPL)                        PlantList-ID (P1070) 
# The World Spider Catalog                    World Spider Catalog ID (P3288) 
# VASCAN                                      VASCAN ID (P1745) 
# WFO (World Flora Online)                    World Flora Online ID (P7715) 
# WoRMS                                       WoRMS-ID for taxa (P850) 
# ZooBank                                     ZooBank ID for name or act (P1746)
