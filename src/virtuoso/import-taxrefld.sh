#!/bin/bash
#
# WARNING - Run the commands below from directory 'virtuoso'

# Environment variables
. ../env.sh

CURRENT_DIR=$(pwd)
DATA_DIR=$CURRENT_DIR/../xr2rml/$DATASET_DIR
ALIGN_DIR=$CURRENT_DIR/../alignments


# Static metadata graph
graph="http://taxref.mnhn.fr/lod/graph/metadata"
./virtuoso-import.sh --cleargraph --path $CURRENT_DIR/../../dataset  --graph $graph Taxrefld_static%.ttl


graph="http://taxref.mnhn.fr/lod/graph/biblio"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    biblio.ttl

graph="http://taxref.mnhn.fr/lod/graph/locations"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    locations.ttl

graph="http://taxref.mnhn.fr/lod/graph/statuscodes"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    statusCodes.ttl statusBiblio.ttl

graph="http://taxref.mnhn.fr/lod/graph/media"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    media.ttl

graph="http://taxref.mnhn.fr/lod/graph/concepts"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    taxonomy_concepts.ttl

graph="http://taxref.mnhn.fr/lod/graph/classes/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    taxonomy_classes.ttl

graph="http://taxref.mnhn.fr/lod/graph/habitats/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    habitats.ttl

graph="http://taxref.mnhn.fr/lod/graph/statuses/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    statuses.ttl

graph="http://taxref.mnhn.fr/lod/graph/vernacular/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    vernaculars.ttl

graph="http://taxref.mnhn.fr/lod/graph/interactions/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    interactions%.ttl

graph="http://taxref.mnhn.fr/lod/graph/dbxref/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    externalIds_dbxref_%.ttl

graph="http://taxref.mnhn.fr/lod/graph/webpages/$DATASET_VERSION"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    externalIds_webpages.ttl

graph="http://taxref.mnhn.fr/lod/graph/links-worms"
./virtuoso-import.sh --cleargraph --path $DATA_DIR --graph $graph    links_worms.ttl


# After the taxonomy is loaded, use add_dwc_ranks.py to generate files dwc_*.ttl
graph="http://taxref.mnhn.fr/lod/graph/classes/$DATASET_VERSION"
./virtuoso-import.sh --path $DATA_DIR --graph $graph    dwc_%.ttl



# Calculated links
graph="http://taxref.mnhn.fr/lod/graph/links-agrovoc"
./virtuoso-import.sh --cleargraph --path $DATA_DIR   --graph $graph    links-agrovoc.nt

graph="http://taxref.mnhn.fr/lod/graph/links-ncbi"
./virtuoso-import.sh --cleargraph --path $DATA_DIR   --graph $graph    links-ncbi.nt
