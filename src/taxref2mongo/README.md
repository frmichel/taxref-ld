## Query TAXREF and import data into MongoDB

This folder provides scripts to (1) query the [TAXREF Web API](https://taxref.mnhn.fr/taxref-web/api/doc) and retrieve all the available information (files ```query_*.sh```), and (2) import the data files into MongoDB as separate collections (files ```import_*.sh```).

Some imports execute aggregate queries to join separate collections. As a result, the following order must be respected when importing data into MongoDB:

#### The following scripts can executed in any order:
- import_biblio.sh
- import_interactions.sh
- import_locations.sh
- import_vernaculars.sh

#### The following scripts must be executed in this order:
- import_taxonomy.sh
- import_externalIds.sh

#### The following scripts must be executed in this order:
- import_status_types.sh
- import_statuses.sh
- import_status_codes.sh

Script ```run_all.sh``` orchestrates all the script calls in the proper sequence order.
