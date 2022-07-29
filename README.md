  # TAXREF-LD: Knowledge Graph of the French taxonomic registry

TAXREF-LD is the Linked Data knowledge graph representing [TAXREF](https://inpn.mnhn.fr/programme/referentiel-taxonomique-taxref?lg=en), the French national taxonomical register for fauna, flora and fungus, that covers mainland France and overseas territories.

In version 15, TAXREF-LD registers **657,000+ scientific names** and **199,000+ species**.

TAXREF-LD is a joint initiative of the [UMS Patrinat](http://www.patrinat.fr/) of the [National Museum of Natural History](http://www.mnhn.fr/), and the [I3S laboratory](http://www.i3s.unice.fr/) of [University Côte d'Azur](https://univ-cotedazur.fr), [CNRS](https://www.cnrs.fr) and [Inria](https://www.inria.fr).


## Data Modelling and Scope

The main modelling choices in TAXREF-LD are as follows:
- **each taxon is represented as an OWL class**, in the sense of the set of biological individuals that belong to that taxonomic group. A taxon is related to a reference scientific name (a.k.a. valid or accepted name), and any number of synonym names.
- **each scientific name is modelled as a SKOS concept** (an instance of the skos:Concept class) as well as an instance of the TDWG ontology's TaxonName class.

Additional information is provided for each taxon such as its taxonomic rank, parent taxon, vernacular names, habitat and biogeographical statuses.
This RDF modeling is detailed are provided in [1], that applies to TAXREF-LD v10.0.

Beyond strictly taxonomic information, additional data are provided: **species interactions**, **legal statuses** (conventions, directives, regulations, protections), **conservation statuses** (international/european/national/regional red lists), **location and bibliographical sources for vernacular names**, **cross-references to other datasources** by means of external IDs and webpages, **media** (photos of taxa).

The modelling is exemplified in [dataset/examples](dataset/examples).

### URIs naming scheme

TAXREF-LD namespace is `http://taxref.mnhn.fr/lod/`. All URIs are dereferenceable.

The dataset itslef is identified by URI [`http://taxref.mnhn.fr/lod/taxref-ld`](http://taxref.mnhn.fr/lod/taxref-ld). It comes with  descriptions in DCAT, VOID and SPARQL SD vocabularies.

Taxa are assigned URIs in `http://taxref.mnhn.fr/lod/taxon/`, while scientific names are assigned URIs in `http://taxref.mnhn.fr/lod/name/`.


### Interlinking with other taxonomic registries and biodiversity sources

TAXREF-LD is linked with multiple third-party biodiversity data sources by means of external IDs and webpages, including in particular AlgaeBase, Fauna Europaea, FishBase, GBIF, IPNI, Index Fungorum, The Plant List, TROPICOS, WoRMS.

TAXREF-LD is also interlinked with third-party Linked Data taxonomic registries: [NCBI Organismal Classification](http://bioportal.bioontology.org/ontologies/NCBITAXON), [AGROVOC](http://aims.fao.org/agrovoc) and [World Register of Marine Species](http://www.marinespecies.org) (WORMS).


## Versioning

A new version of TAXREF is released yearly. TAXREF-LD bears the same major version number (e.g. 13.0, 15.0...), and intermediate versions may be realeased with a minor revision number (e.g. 15.1).

## Downloading and Querying

### Data dumps

The dataset is downloadable as a set of RDF dumps (in Turtle syntax). As of version 15, the dumps are available from Zenodo.
Previous versions are still aviable on this Github repo:

| Version  | Download link |
| ----  | ---- |
| 15.2 | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.6940891.svg)](https://doi.org/10.5281/zenodo.6940891) |
| 15.1 | [![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5876775.svg)](https://doi.org/10.5281/zenodo.5876775) |
| 13.0 | https://github.com/frmichel/taxref-ld/tree/13.0/dataset |
| 12.0 | https://github.com/frmichel/taxref-ld/tree/12.0/dataset |
| 10.0 | https://github.com/frmichel/taxref-ld/tree/10.0/dataset |


The dataset metadata (in DCAT, VOID and SPARQL SD) as well as the definition of vocabulary terms (classes, concepts, properties) used to represent taxonomic data are provided in `dataset/Taxrefld_static*.ttl`. Whenever possible, these terms are aligned with their counterparts in thrid-party ontologies.


### SPARQL endpoint

TAXREF-LD can also be queried through our public Virtuoso OS **SPARQL endpoint https://taxref.mnhn.fr/sparql**.

You may use the [Faceted Browser](http://taxref.i3s.unice.fr/fct/) to look up text or URIs.
As an example, you can look up taxon [http://taxref.mnhn.fr/lod/taxon/60878](http://taxref.mnhn.fr/lod/taxon/60878).

The following **named graphs** can be queried from our SPARQL endpoint:

| Named graph    | Description | No. RDF triples |
| -------------  | ---- | ----: |
| `http://taxref.mnhn.fr/lod/graph/metadata` | DCAT, VOID and SPARQL SD dataset descriptions + definition of various classes, concepts, properties (content of files `dataset/Taxrefld_static*.ttl`) |1,740|
| `http://taxref.mnhn.fr/lod/graph/biblio` | bibliographic resources |408,737|
| `http://taxref.mnhn.fr/lod/graph/locations` | regions, departements, territories etc. |393,496|
| `http://taxref.mnhn.fr/lod/graph/media` | media (photos) linked to taxa |690,508|
| `http://taxref.mnhn.fr/lod/graph/statuscodes` | description of the status values of types international convention, european directive, protection and regulation. These are represented as instances of the class bibo:DocumentPart (e.g. http://taxref.mnhn.fr/lod/status/BONN/IBOAC) and related to the bibliographic source describing the document with property dct:isPartOf (content of files `statusCodes.ttl` and `statusBiblio.ttl`) |1,804|
| `http://taxref.mnhn.fr/lod/graph/classes/{TAXREF version}` | description of taxa as OWL classes |4,374,167|
| `http://taxref.mnhn.fr/lod/graph/concepts/{TAXREF version}` | description of scientific names as SKOS concepts |7,799,394|
| `http://taxref.mnhn.fr/lod/graph/interactions/{TAXREF version}` | species interactions |303,025|
| `http://taxref.mnhn.fr/lod/graph/statuses/{TAXREF version}` | all taxa statuses (legal, biogeographical, red list) |7,846,358|
| `http://taxref.mnhn.fr/lod/graph/vernacular/{TAXREF version}` | taxa vernacular names (direct and as SKOS-XL labels) |518,708|
| `http://taxref.mnhn.fr/lod/graph/dbxref/{TAXREF version}` | cross-references to identifiers of third-party data sources such as GBIF, WoRMS, the Plant List etc. |10,330,904|
| `http://taxref.mnhn.fr/lod/graph/webpages/{TAXREF version}` | `foaf:page` links to webpages |2,567,841|
| `http://taxref.mnhn.fr/lod/graph/links-*/{TAXREF version}` | interllinking to equivalent URIs from NCBI, Agrovoc, WoRMS |250,249|
| Total | | 35,486,931 |

## License

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/fr/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/3.0/fr/88x31.png" /></a><br />

This dataset is made available under the terms of the [Creative Commons Attribution 3.0 France](https://creativecommons.org/licenses/by/3.0/fr/) (CC BY 3.0 FR) license.

The code used to produce the dataset, provided in folder src, is licensed under the [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).


## Cite this work

When mentioning TAXREF-LD in a publication or when redistributing it, please cite this way:

TAXREF-LD: Knowledge Graph of the French taxonomic registery. Franck Michel, Catherine FARON, Sandrine TERCERIE, Olivier GARGOMINY. 2017-2022. https://doi.org/10.5281/zenodo.5848916


## Reference(s)

[1] Michel F., Gargominy O., Tercerie S. & Faron-Zucker C. (2017). A Model to Represent Nomenclatural and Taxonomic Information as Linked Data. Application to the French Taxonomic Register, TAXREF. In _Proceedings of the 2nd International Workshop on Semantics for Biodiversity (S4BioDiv) co-located with ISWC 2017_. CEUR vol. 1933. Vienna, Austria.
