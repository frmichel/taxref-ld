# TAXREF-LD: the French Linked Data Taxonomic Registery

TAXREF-LD is the Linked Data representation of [TAXREF](https://inpn.mnhn.fr/programme/referentiel-taxonomique-taxref?lg=en), the French national taxonomical register for fauna, flora and fungus, that covers mainland France and overseas territories. It accounts for 590000+ scientific names.

TAXREF-LD is a joint initiative of the [UMR Patrinat](http://www.patrinat.fr/) of the [National Museum of Natural History](http://www.mnhn.fr/) and the [I3S laboratory](http://www.i3s.unice.fr/), Université Côte d'Azur, Inria, CNRS.


### Modelling

The main modelling choices in TAXREF-LD are as follows:
- **each taxon is represented as an OWL class**, in the sense of the set of biological individuals that belong to that taxonomic group. A taxon is related to a reference scientific name (a.k.a. valid or accepted name), and any number of synonym scientific names.
- **each scientific name is modelled as a SKOS concept** (an instance of the skos:Concept class) as well as an instance of the TDWG ontology's TaxonName class.

Additional information is provided for each taxon such as its taxonomic rank, parent taxon, vernacular names, habitat and biogeographical statuses.
This RDF modeling is detailed are provided in [1], that applies to TAXREF-LD v10.0.

As of version 12.0, additional information is provided: **species interactions**, **legal statuses** (conventions, directives, regulations, protections), **conservation statuses** (international/european/national/regional red lists), **location and bibliographical sources for vernacular names**, **cross-references to other datasources** by means of external IDs and webpages, **media** (photos of taxa).

The modelling is exemplified in directory [dataset/example](dataset/example).


### Interlinking with other taxonomic registries and biodiversity sources

TAXREF-LD is linked with multiple third-party biodiversity data sources by means of external IDs and webpages, including in particular AlgaeBase, Fauna Europaea, FishBase, GBIF, IPNI, Index Fungorum, The Plant List, TROPICOS, WoRMS.

TAXREF-LD is also interlinked with third-party Linked Data taxonomic registries: [NCBI Organismal Classification](http://bioportal.bioontology.org/ontologies/NCBITAXON), [Vertebrate Taxon Ontology](http://www.ontobee.org/ontology/VTO) (VTO), [AGROVOC](http://aims.fao.org/agrovoc), [GeoSpecies](https://datahub.io/dataset/geospecies), [TaxonConcept](https://datahub.io/dataset/taxonconcept), and [World Register of Marine Species](http://www.marinespecies.org) (WORMS).


### Versioning

A new version of TAXREF is released every year. TAXREF-LD bears the same version number. 

TAXREF-LD was first released as a translation of TAXREF 10.0. It may not be updated every year (for instance there is no TAXREF-LD version 11.0).


### Downloading and SPARQL Querying

The dataset is downloadable as a set of RDF dumps (in Turtle syntax) provided in directory [dataset](dataset).

Additional files (`dataset/Taxrefld_static*.ttl`) provide DCAT and VOID dataset descriptions, and define various terms (classes, concepts, properties) used to represent taxonomic data. Whenever possible, these terms are aligned with counterparts in thrid-party ontologies.

Alternatively, TAXREF-LD can be queried through our Virtuoso OS SPARQL endpoint http://taxref.mnhn.fr/sparql, that contains the following **named graphs**:
- `http://taxref.mnhn.fr/lod/graph/metadata`: DCAT and VOID dataset descriptions + definition of various classes, concepts, properties (content of files `dataset/Taxrefld_static*.ttl`).
- `http://taxref.mnhn.fr/lod/graph/biblio`: bibliographic resources
- `http://taxref.mnhn.fr/lod/graph/locations`: regions, tepartements, territories etc.
- `http://taxref.mnhn.fr/lod/graph/biblio`: media (photos) linked to taxa
- `http://taxref.mnhn.fr/lod/graph/statusCodes`: description of the status values of types international convetion, european directive, protection and regulation. These are represented as instances of the class bibo:DocumentPart (e.g. http://taxref.mnhn.fr/lod/status/BONN/IBOAC) and related to the bibliographic source describing the document with property dct:isPartOf (content of files `Taxrefld_statusCodes.ttl` and `Taxrefld_statusBiblio.ttl`)
- `http://taxref.mnhn.fr/lod/graph/interactions/{TAXREF version}`: species interactions
- `http://taxref.mnhn.fr/lod/graph/classes/{TAXREF version}`: description of taxa as OWL classes 
- `http://taxref.mnhn.fr/lod/graph/concepts/{TAXREF version}`: description of scientific names as SKOS concepts
- `http://taxref.mnhn.fr/lod/graph/statuses/{TAXREF version}`: all taxa statuses (legal, biogeographical, red list)
- `http://taxref.mnhn.fr/lod/graph/vernacular/{TAXREF version}`: taxa vernacular names (direct and as SKOSXL labels)
- `http://taxref.mnhn.fr/lod/graph/dbxref/{TAXREF version}`: cross-references to third-party data sources such as GBIF, WoRMS, the Plant List etc.
- `http://taxref.mnhn.fr/lod/graph/webpages/{TAXREF version}`: `foaf:page` links to webpages
- `http://taxref.mnhn.fr/lod/graph/links-*/{TAXREF version}`: interllinking graphs where `links-*` stands for several values like `links-agrovoc`, `links-ncbi` etc.


You may also use the [Faceted Browser](http://sparks-vm33.i3s.unice.fr:8890/fct/) to look up text or URIs.
As an example, you can look up taxon [http://taxref.mnhn.fr/lod/taxon/60878/12.0](http://taxref.mnhn.fr/lod/taxon/60878/12.0).


## License

See the [LICENSE file](LICENSE).


### Reference(s)

[1] Michel F., Gargominy O., Tercerie S. & Faron-Zucker C. (2017). A Model to Represent Nomenclatural and Taxonomic Information as Linked Data. Application to the French Taxonomic Register, TAXREF. In _Proceedings of the 2nd International Workshop on Semantics for Biodiversity (S4BioDiv) co-located with ISWC 2017_. CEUR vol. 1933. Vienna, Austria.
