#!/bin/bash
# Author: F. Michel, UCA, CNRS, Inria

./run_xr2rml.sh biblio
./run_xr2rml.sh externalIds_webpages
./run_xr2rml.sh externalIds_worms
./run_xr2rml.sh habitats
./run_xr2rml.sh interactions
./run_xr2rml.sh locations
./run_xr2rml.sh media            
./run_xr2rml.sh statuses
./run_xr2rml.sh statusCodes
./run_xr2rml.sh statusBiblio
./run_xr2rml.sh taxonomy_classes
./run_xr2rml.sh taxonomy_concepts
./run_xr2rml.sh vernaculars

./run_xr2rml_externalIds_dbxref.sh  "AlgaeBase"                       "wdt:P1348"
./run_xr2rml_externalIds_dbxref.sh  "Avibase"                         "wdt:P2026" 
./run_xr2rml_externalIds_dbxref.sh  "BDTFX"                           "wdt:P3105" 
./run_xr2rml_externalIds_dbxref.sh  "Fauna Europaea"                  "wdt:P1895" 
./run_xr2rml_externalIds_dbxref.sh  "FishBase"                        "wdt:P938" 
./run_xr2rml_externalIds_dbxref.sh  "GBIF"                            "wdt:P846"
./run_xr2rml_externalIds_dbxref.sh  "IPNI"                            "wdt:P961"
./run_xr2rml_externalIds_dbxref.sh  "Index Fungorum"                  "wdt:P1391" 
./run_xr2rml_externalIds_dbxref.sh  "Mantodea Species File Online"    "wdt:P6055" 
./run_xr2rml_externalIds_dbxref.sh  "Orthoptera Species File Online"  "wdt:P6050" 
./run_xr2rml_externalIds_dbxref.sh  "Phasmida Species File Online"    "wdt:P4855" 
./run_xr2rml_externalIds_dbxref.sh  "Psyl'list"                       "wdt:P6376" 
./run_xr2rml_externalIds_dbxref.sh  "SANDRE"                          "wdt:P1717" 
./run_xr2rml_externalIds_dbxref.sh  "TROPICOS"                        "wdt:P960" 
./run_xr2rml_externalIds_dbxref.sh  "The Plant List (TPL)"            "wdt:P1070" 
./run_xr2rml_externalIds_dbxref.sh  "The World Spider Catalog"        "wdt:P3288" 
./run_xr2rml_externalIds_dbxref.sh  "VASCAN"                          "wdt:P1745" 
./run_xr2rml_externalIds_dbxref.sh  "WoRMS"                           "wdt:P850" 

# > db.externalIds.distinct("externalDbName").sort()

# ANTCAT
# AUBLET2
# AlgaeBase                                   AlgaeBase URL (P1348)
# Amphibian Species of the World              Amphibian Species of the World ID (P5354) 
# Antarctic Freshwater Diatoms
# Aphid Species File
# Ascomycota de métropole  (Adonif 2017)
# Avibase                                     Avibase ID (P2026) 
# BD Titan sur les Cerambycidés ou Longicornes
# BDLFX
# BDNGM
# BDTFX
# BRYO_FR_FCBN
# BirdLife                                    BirdLife taxon ID (P5257)
# Blattodea Species File Online
# CJB (Herbier de Ganève)
# CRUSTA
# Catalogue of Diatom Names
# Catalogue of Life
# Checklist of the Western Palaearctic Bees
# Chilobase
# Cockroach\r Species File Online             Cockroach Species File ID (P6052) 
# Coreoidea Species File Online               Coreoidea Species File ID (P6053) 
# DORIS                                       DORIS ID (P4630) 
# Dermaptera Species File Online
# DriloBASE TAXO
# EPPO Global Database                        EPPO Code (P3031) 
# Embioptera Species File Online
# Euro+Med Plantbase
# FAO
# FATERCAL
# FLORICAL
# FLOW
# Fauna Europaea                              Fauna Europaea ID (P1895) 
# FishBase                                    FishBase species ID (P938) 
# Flora Gallica (2014)
# Fonge de métropole (Adonif 2018)
# GBIF                                        Global Biodiversity Information Facility ID (P846) 
# GRIN
# GenBank
# Global Biodiversity of Eumycetozoans
# Global Invasive Species Database            Global Invasive Species Database ID (P5626) 
# IPNI                                        IPNI plant ID (P961) 
# ISSG
# ITIE
# ITM
# ITR
# IUCN Red List
# Index Fungorum                              Index Fungorum ID (P1391) 
# Index Hepaticarum                           Index Hepaticarum ID (P2794) 
# Index Nominum Algarum
# International Committee on Taxonomy of Viruses          ICTV virus ID (P1076)  
# Mammal Species of the World                 MSW ID (P959)
# Mantodea Species File Online                Mantodea Species File ID (P6055) 
# Mycobank                                    MycoBank taxon name ID (P962) 
# Nadeaud
# Odonata Central
# On-line Systematic Catalog of Plant Bugs (Insecta: Heteroptera: Miridae)
# Orthoptera Species File Online              OSF Online ID (P6050) 
# PESI
# POWO                                        Plants of the World online ID (P5037) 
# Phasmida Species File Online                Phasmida Species File ID (P4855) 
# Plecoptera Species File Online
# Psocodea Species File Online
# Psyl'list                                   Psyl'list species ID (P6376) 
# Quadrige²
# Rotifer World Catalog (RWC)
# SANDRE                                      SANDRE ID (P1717) 
# SeaLifeBase                                 SeaLifeBase ID (P6018) 
# Systema Dipterorum
# Systematic Catalog of Culicidae             Systematic Catalog of Culicidae ID (P6057)
# TROPICOS                                    Tropicos ID (P960) 
# The Global Lepidoptera Names Index          LepIndex ID (P3064) 
# The Plant List (TPL)                        PlantList-ID (P1070) 
# The World Spider Catalog                    World Spider Catalog ID (P3288) 
# VASCAN                                      VASCAN ID (P1745) 
# WIKWIO
# WoRMS                                       WoRMS-ID for taxa (P850) 
# World Checklist of Selected Plant Families (WCSP)       WCSPF ID (P3591) 
# ZooBank                                     ZooBank ID for name or act (P1746)
