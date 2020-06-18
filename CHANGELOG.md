# TAXREF-LD changelog

## [13.0] 2020-06-18

### Added
- Update with TAXREF version 13.0
- Added media (photos) associated with taxa
- Added direct link to external identifiers (in addition to `schema:identifier`) (issue #3)

### Changed
- Vernacular names modelled as instances of `skosxl:Label` instead of using reification. New property `taxrefprop:vernacularNamesXL` (issue #2)
- Added documentation describing Turtle archives and generation pipeline (issue #4)
- Older versions managed with tags instead of keeping separate folders in dataset
- Fixed bug in external identifiers: Wikidata properties were in namespace `http://www.wikidata.org/entity/`, changed to `http://www.wikidata.org/prop/direct/`
- External identifiers forced to type string


## [12.0] 2019-11-12

### Added
- Update with TAXREF version 12.0
- Added legal statuses (directives, conventions, regulations, protections)
- Added conservation statuses (from international/european/national/regional red lists)
- Added species interactions
- Added location and bibliographical source to vernacular names (reified statements)
- Added cross-references to other datasources by means of external IDs (see property `schema:identifier` on taxa (owl:Class) and scientific names (skos:Concept))
- Added equivalent webpages of other datasources (see property `foaf:page` on taxa (owl:Class) and scientific names (skos:Concept))

### Changed
- Biogeographical statuses modelled in a more general way consistent with other types of statuses

