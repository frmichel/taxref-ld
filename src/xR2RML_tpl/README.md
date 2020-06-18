## Translate TAXREF into RDF

This folder provides the scripts, configuration and mappings files involved in the translatation of TAXREF data into RDF using Morph-xR2RML.
The translation is carried out using [Morph-xR2RML](https://github.com/frmichel/morph-xr2rml/) that is provided as a single JAR file. **Java 11+ is required**.

Files `xr2rml*_tpl.ttl` describe the mapping of TAXREF documents, previously loaded into the MongoDB database, into RDF.
Details about how to write the mappings can be found in the [xR2RML mapping language specification](http://i3s.unice.fr/~fmichel/xr2rml_specification.html).

The mapping files are templates that need to be instantiated by replaing placeholders between '{{' and '}}'. Placeholders are used for instance for the TAXREF version.


**Script `run_xr2rml_all.sh` is the main entry point.** Comment or uncomment the lines as needed to run the generation of each part of TAXREF-LD.
