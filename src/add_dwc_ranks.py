#!/bin/python3
# Generate the taxonomic rank triples using DarwinCore properties: dwc:species, dwc:genus etc.
# Transitivity of ranks is used, e.g. a species gets a dwc:species, dwc:genus up to a dwc:kingdom.
#
# Run command '. ./env.sh' before running this script, or manually set variable DATASET_VERSION, e.g.:
# - on Linux:   export  DATASET_VERSION=17.0
# - on Windows: set     DATASET_VERSION=17.0
# The queries below retrieve ~300.000 results => update param ResultSetMaxRows in virtuoso.ini before running

import requests
import urllib.parse
import os

# Get current version from the environement variables
DATASET_VERSION = os.getenv("DATASET_VERSION")
if DATASET_VERSION is None:
    print('Variable DATASET_VERSION undefined. Run env.sh before running this script.')
    exit()
print(f"DATASET_VERSION: {DATASET_VERSION}")


endpoint = "https://taxref.mnhn.fr/sparql?query="
headers = { 'accept' : 'text/turtle' }


def run_query(query, outputfile):
    output = requests.get(endpoint + urllib.parse.quote(query), headers = headers)
    with open(outputfile, "w") as f:
        f.write(output.text)
    return

prefixes = '''
    prefix rdfs:           <http://www.w3.org/2000/01/rdf-schema#>
    prefix owl:            <http://www.w3.org/2002/07/owl#>
    prefix dwc:            <http://rs.tdwg.org/dwc/terms/>
    prefix taxref:         <http://taxref.mnhn.fr/lod/>
    prefix taxrefprop:     <http://taxref.mnhn.fr/lod/property/>
    prefix taxrefrk:       <http://taxref.mnhn.fr/lod/taxrank/>
'''


# Add dwc:subgenus
query = prefixes + """
    construct { ?s dwc:subgenus ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:SubGenus;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }
"""
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_subgenus.ttl")


# Add dwc:genus
query = prefixes + '''
    construct { ?s dwc:genus ?tLabel. } 
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Genus;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_genus.ttl")


# Add dwc:subfamily
query = prefixes + '''
    construct { ?s dwc:subfamily ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:SubFamily;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_subfamily.ttl")


# Add dwc:family
query = prefixes + '''
    construct { ?s dwc:family ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Family;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_family.ttl")


# Add dwc:order
query = prefixes + '''
    construct { ?s dwc:order ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Order;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_order.ttl")


# Add dwc:phylum
query = prefixes + '''
    construct { ?s dwc:phylum ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Phylum;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_phylum.ttl")


# Add dwc:kingdom
query = prefixes + '''
    construct { ?s dwc:kingdom ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/{DATASET_VERSION}> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Kingdom;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query.replace('{DATASET_VERSION}',  DATASET_VERSION), "dwc_kingdom.ttl")

