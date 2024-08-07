# TAXREF-LD changelog


## [17.0] 2024-07-30

### Added
- New SKOS collections: [taxref:TaxonomicRankCollection](http://taxref.mnhn.fr/lod/taxrank/TaxonomicRankCollection), [taxreftl:TrophicLevelCollection](http://taxref.mnhn.fr/lod/trophicLevel/TrophicLevelCollection), and [taxref:TaxonomicNameCollection](http://taxref.mnhn.fr/lod/TaxonomicNameCollection)
- Various properties in dataset metadata: `vann:changes`, `owl:deprecated`
- Split vernacular names that contain a comma into multiple values (done with property `taxrefprop:vernacularName` but not with `taxrefprop:vernacularNameXL` as a `skosxl:Label` can have only one `skosxl:literalForm`)

### Changed
- Update to TAXREF version 17
- Change URIs of graphs to non-versioned URIs
- Fixed issue in the generation of the interactions: some interactions involve the TAXREF ids of synonyms, not reference names. As a results, the process was generating wrong URIs of taxa with ids of synonyms. The fix is to refer always to the referenceId field of the interaction.
- Fixed issue in the generation of the DBXRefs: all ids were used as taxa whereas some ids are not reference ids. That lead to generating wrong URIs of taxa with ids of synonyms.
- Fixed bug in the generation of vernacular names: names were generated with 3-letter language tags that must be mapped to 2-letter tags, e.g. @fra instead of @fr


## [15.2] 2022-07-29

### Changed
- Fixed issues in the ontology (owl:AnnotationProperties instead of owl:ObjectProperties)
- Update of dataset metadata (fixed issues, added dcat:Distribution, better named graphs description...)
- Regenerate taxonomy (taxa and names) to fix an issue with missing taxa (detected with Agroportal)
- Reorganize data dump as a zip file with subfolders rather than a tar of zip files


## [15.1] 2022-01-19

### Added
- Development stages and sex as part of the species interactions, e.g.: species A in larva stage feeds on B.
- Links with External IDs for Cockroach Species File Online, IUCN Red List, World Flora Online, ZooBank
- For each taxon, add Darwin Core properties with higher levels ranks: `dwc:subgenus`, `dwc:genus`, `dwc:subfamily`, `dwc:family`, `dwc:order`, `dwc:kingdom` (issue #8)
- Add owl:sameAs links from locations to SANDRE URIs

### Changed
- Update to TAXREF version 15
- Remove TAXREF version from all URIs of the dataset, keep version only with `owl:versionInfo` of the dataset resource
- Change modeling of ranks, habitats & status values: gather them in SKOS collections rather than making them instances of a subclass of `skos:Concept`
- Upgrade to Morph-xR2RML version 1.3.2



## 2021-05-07

### Changed
- Add direct link to image files with `foaf:depiction` (in addition to instances of `schema:ImageObject` with `schema:image`) (issue #6)
- Add `dct:identifier` to taxa and names with TAXREF identifier
- Dataset description: add a SPARQL Service Description, and refactoring into a single file `Taxrefld_static_dataset_description.ttl`


## [13.0] 2020-06-23 - TAXREF v13

### Added
- Update with TAXREF version 13.0
- Added media files associated with taxa
- Added direct link to external identifiers (in addition to `schema:identifier`) (issue #3)

### Changed
- Vernacular names modelled as instances of `skosxl:Label` instead of using reification. New property `taxrefprop:vernacularNamesXL` (issue #2)
- Added documentation describing Turtle archives and generation pipeline (issue #4)
- Older versions managed with tags instead of keeping separate versioned folders in directory `dataset`
- Fixed bug in external identifiers: Wikidata properties were in namespace `http://www.wikidata.org/entity/`, changed to `http://www.wikidata.org/prop/direct/`
- External identifiers forced to type string


## [12.0] 2019-11-12 - TAXREF v12

### Added
- Added legal statuses (directives, conventions, regulations, protections)
- Added conservation statuses (from international/european/national/regional red lists)
- Added species interactions
- Added location and bibliographical source to vernacular names (reified statements)
- Added cross-references to other datasources by means of external IDs (see property `schema:identifier` on taxa (owl:Class) and scientific names (skos:Concept))
- Added equivalent webpages of other datasources (see property `foaf:page` on taxa (owl:Class) and scientific names (skos:Concept))

### Changed
- Update with TAXREF version 12
- Biogeographical statuses modelled in a more general way consistent with other types of statuses

