## Query TAXREF API and import data into MongoDB

This folder provides the scripts used to (1) query the [TAXREF Web API](https://taxref.mnhn.fr/taxref-web/api/doc) and retrieve all the available information (files `query_*.sh`), and (2) import the data files into MongoDB as separate collections (files `import_*.sh`).

**Script `run_all.sh` orchestrates all the scripts in the proper sequence order.**

Some imports include execution of aggregate queries to join separate collections (files `*.js`). As a result the following order must be respected when importing data into MongoDB:

#### 1. The following scripts can executed in any order:
- import_biblio.sh
- import_interactions.sh
- import_locations.sh
- import_vernaculars.sh

#### 2. The following scripts must be executed in this order:
- import_taxonomy.sh
- import_externalIds.sh

#### 3. The following scripts must be executed in this order:
- import_status_types.sh
- import_statuses.sh
- import_status_codes.sh

