# TAXREF-LD generation pipeline

Several steps are involved in the generation of the TAXREF-LD RDF dataset. This folder provides the tools, scripts and mappings files involved in carrying out these steps.


### Downloading TAXREF and loading it into MongoDB

In a first step, the pipeline queries the [TAXREF Web API](https://taxref.mnhn.fr/taxref-web/api/doc) to fetch relevant data about all the taxa available in TAXREF.

The JSON content retrieved from the TAXREF Web API is then uploaded into a MongoDB database, and pre-processed with MongoDB aggregation queries to prepare the JSON documents for the next step.

Directory [taxref2mongo](taxref2mongo) provides the scripts involved in this step, together will further details.


### RDF files generation

In a second step, the translation to RDF is carried out using [Morph-xR2RML](https://github.com/frmichel/morph-xr2rml/), an implementation of the [xR2RML mapping language](http://i3s.unice.fr/~fmichel/xr2rml_specification.html) [1] for MongoDB databases.

The scripts, configuration and mapping files are provided in directory [xR2RML_tpl](xR2RML_tpl).


### References

[1] F. Michel, L. Djimenou, C. Faron-Zucker, and J. Montagnat. Translation of Relational and Non-Relational Databases into RDF with xR2RML.
In Proceedings of the *11th International Confenrence on Web Information Systems and Technologies (WEBIST 2015)*, Lisbon, Portugal, 2015.

