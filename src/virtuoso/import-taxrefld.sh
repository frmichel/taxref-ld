#!/bin/bash
#
# WARNING - Run the commands below from directory 'virtuoso'

CURRENT_DIR=$(pwd)
DATASET_DIR=$CURRENT_DIR/../xR2RML
ALIGN_DIR=$CURRENT_DIR/../alignments


# Static metadata graph
graph="http://taxref.mnhn.fr/lod/graph/metadata"
./virtuoso-import.sh --cleargraph --path $CURRENT_DIR/../../dataset  --graph $graph Taxrefld_static%.ttl


# Main content non-versioned graphs
graph="http://taxref.mnhn.fr/lod/graph/biblio"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_biblio.ttl

graph="http://taxref.mnhn.fr/lod/graph/locations"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_locations.ttl

graph="http://taxref.mnhn.fr/lod/graph/statuscodes"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_statusCodes.ttl Taxrefld_statusBiblio.ttl

graph="http://taxref.mnhn.fr/lod/graph/media"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_media.ttl

graph="http://taxref.mnhn.fr/lod/graph/concepts"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_taxonomy_concepts.ttl



# Main content versioned graphs
graph="http://taxref.mnhn.fr/lod/graph/classes"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_taxonomy_classes.ttl

graph="http://taxref.mnhn.fr/lod/graph/habitats"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_habitats.ttl

graph="http://taxref.mnhn.fr/lod/graph/statuses"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_statuses.ttl

graph="http://taxref.mnhn.fr/lod/graph/vernacular"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_vernaculars.ttl

graph="http://taxref.mnhn.fr/lod/graph/interactions"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_interactions.ttl

graph="http://taxref.mnhn.fr/lod/graph/dbxref"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_externalIds_dbxref_%.ttl

graph="http://taxref.mnhn.fr/lod/graph/webpages"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_externalIds_webpages.ttl


# WoRMS links
graph="http://taxref.mnhn.fr/lod/graph/links-worms"
./virtuoso-import.sh --cleargraph --path $DATASET_DIR --graph $graph    Taxrefld_externalIds_worms.ttl


# Calculated links
graph="http://taxref.mnhn.fr/lod/graph/links-agrovoc"
./virtuoso-import.sh --cleargraph --path $ALIGN_DIR   --graph $graph    links-agrovoc.nt

graph="http://taxref.mnhn.fr/lod/graph/links-geospecies"
./virtuoso-import.sh --cleargraph --path $ALIGN_DIR   --graph $graph    links-geospecies.nt

graph="http://taxref.mnhn.fr/lod/graph/links-ncbi"
./virtuoso-import.sh --cleargraph --path $ALIGN_DIR   --graph $graph    links-ncbi.nt

graph="http://taxref.mnhn.fr/lod/graph/links-taxonconcept"
./virtuoso-import.sh --cleargraph --path $ALIGN_DIR   --graph $graph    links-taxonconcept.nt

graph="http://taxref.mnhn.fr/lod/graph/links-vto"
./virtuoso-import.sh --cleargraph --path $ALIGN_DIR   --graph $graph    links-vto.nt
