## TAXREF-LD: the French Linked Data Taxonomic Register

TAXREF-LD is the Linked Data representation of [TAXREF](https://inpn.mnhn.fr/programme/referentiel-taxonomique-taxref?lg=en), the French national taxonomical register for fauna, flora and fungus, that covers mainland France and overseas territories. It accounts for over 500000 scientific names.

TAXREF-LD is a joint initiative of the [National Museum of Natural History](http://www.mnhn.fr/) and the [I3S laboratory](http://www.i3s.unice.fr/) (Université Côte d'Azur, CNRS, Inria).

### Modelling
TAXREF-LD models each taxon as an OWL class, and relates it to taxonomic names, either reference (valid or accepted) or synonyms.
Taxonomic names are modelled as instances of the SKOS concept class as well as the TDWG ontology's TaxonName class.
Additional information is provided for each taxon such as its habitat and bio-geographical statuses.
More details are provided in [1].

### Links with other taxonomic registries
Furthermore, TAXREF-LD is linked with third-party Linked Data taxonomic registries: [NCBI Organismal Classification](http://bioportal.bioontology.org/ontologies/NCBITAXON), [Vertebrate Taxon Ontology](http://www.ontobee.org/ontology/VTO) (VTO), [AGROVOC](http://aims.fao.org/agrovoc), [GeoSpecies](https://datahub.io/dataset/geospecies), [TaxonConcept](https://datahub.io/dataset/taxonconcept), and [World Register of Marine Species](http://www.marinespecies.org) (WORMS).

### Versioning

A new release of TAXREF is issued every year. Directory 10.0 of this repository depicts the Linked Data representation of TAXREF v10.0.

### Reference(s)

[1] Michel F., Gargominy O., Tercerie S. & Faron-Zucker C. (2017). A Model to Represent Nomenclatural and Taxonomic Information as Linked Data. Application to the French Taxonomic Register, TAXREF. In _Proceedings of the 2nd International Workshop on Semantics for Biodiversity (S4BioDiv) co-located with ISWC 2017_ vol. 1933. Vienna, Austria. CEUR.
