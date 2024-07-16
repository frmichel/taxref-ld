# TAXREF-LD generation pipeline

Several steps are involved in the generation of the TAXREF-LD RDF dataset. This folder provides the tools, scripts and mappings files involved in carrying out these steps.

The following gives the procedure to generate a new release of the whole dataset.

## Update environment

Update file `env.sh` with the new version of TAXREF.

In file `xr2rml/xr2rml.properties` update property `database.name[0]` to match the value of `$DB` in `env.sh`.


### Downloading TAXREF and loading it into MongoDB

In a first step, the pipeline queries the [TAXREF Web API](https://taxref.mnhn.fr/taxref-web/api/doc) to fetch relevant data available in TAXREF about all the taxa.

The JSON content retrieved from the Web API is then uploaded to a MongoDB database, and pre-processed with MongoDB aggregation queries to prepare the JSON documents for the next step.

Directory [mongo](mongo) provides the scripts involved in this step, together will further documentation.


### RDF files generation

In a second step, the translation to RDF is carried out using [Morph-xR2RML](https://github.com/frmichel/morph-xr2rml/), an implementation of the [xR2RML mapping language](http://i3s.unice.fr/~fmichel/xr2rml_specification.html) [1] for MongoDB databases.

The scripts, configuration and mapping files are provided in directory [xr2rml](xr2rml).


### RDF files import into Virtuoso

RDF files generated at the previous step are imported into a Virtuoso OS instance as separate named graphs. 
The scripts involved are provided in directory [virtuoso](virtuoso).

### Generate the taxon and name ranks using Darwin Core properties

Once the graph is loaded, run script `add_dwc_ranks.py`: this will generate files `dwc_*.ttl`.

Then go back to directory [virtuoso](virtuoso) and run the command that imports these files.
 

### References

[1] F. Michel, L. Djimenou, C. Faron-Zucker, and J. Montagnat. Translation of Relational and Non-Relational Databases into RDF with xR2RML.
In Proceedings of the *11th International Confenrence on Web Information Systems and Technologies (WEBIST 2015)*, Lisbon, Portugal, 2015.

