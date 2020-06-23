# TAXREF-LD downloadable dataset

This folder provides the TAXREF-LD dataset as a set of downloadable RDF dumps (in Turtle syntax).


## Dataset Metadata

#### Dataset description 

Files `Taxrefld_static_dcat.ttl` and `Taxrefld_static_void.ttl` provide the dataset's DCAT and VOID descriptions respectively.


#### Vocabulary definition

Files `Taxrefld_static_defs*.ttl` provide the definition of several terms (classes, concepts and properties) used in TAXREF-LD to represent taxonomic data, locations, statuses etc. Whenever possible, these terms are aligned with counterparts from thrid-party ontologies.


## Resources description

Description of the ressources themseleves (taxa, names etc.) are provided by means of 3 archives:

- `taxrefld-core.zip`: descripton of taxa (OWL classes), scientific names (SKOS concepts), as well as bibliographic resources, locations (regions, tepartements, territories etc.), media files, species interactions, vernacular names;
- `taxrefld-dbxref.zip`: cross-references to third-party data sources by means of identifiers (in GBIF, WoRMS, the Plant List etc.) and webpages;
- `taxrefld-statuses.zip`: taxa statuses (legal, biogeographical, red list) and description of the set of values of legal statuses  (international convetion, european directive, protection and regulation).
