#!/bin/python3

import requests
import urllib.parse


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
query = prefixes + '''
    construct { ?s dwc:subgenus ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:SubGenus;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }
'''
run_query(query, "dwc_subgenus.ttl")


# Add dwc:genus
query = prefixes + '''
    construct { ?s dwc:genus ?tLabel. } 
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Genus;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_genus.ttl")


# Add dwc:subfamily
query = prefixes + '''
    construct { ?s dwc:subfamily ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:SubFamily;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_subfamily.ttl")


# Add dwc:family
query = prefixes + '''
    construct { ?s dwc:family ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Family;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_family.ttl")


# Add dwc:order
query = prefixes + '''
    construct { ?s dwc:order ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Order;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_order.ttl")


# Add dwc:phylum
query = prefixes + '''
    construct { ?s dwc:phylum ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Phylum;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_phylum.ttl")


# Add dwc:kingdom
query = prefixes + '''
    construct { ?s dwc:kingdom ?tLabel. }
    where {
        graph <http://taxref.mnhn.fr/lod/graph/classes/15.0> {
            ?t  a owl:Class;
                taxrefprop:hasRank taxrefrk:Kingdom;
                rdfs:label ?tLabel.
            ?s rdfs:subClassOf+ ?t.
        }
    }'''
run_query(query, "dwc_kingdom.ttl")

