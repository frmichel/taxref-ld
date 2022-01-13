# Importing RDF files into Virtuoso

To use the tools in this folder, you first need to update script `virtuoso-import.sh`: change the `your password` string to the actual admin password of your Virtuoso instance.

Then, use script `import-taxrefld.sh` to import the different graphs into Virtuoso.
This script assumes that the Turtle files have already been generated in folder `../xr2rml`.
