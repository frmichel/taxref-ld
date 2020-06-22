#!/bin/bash
# Author: Franck MICHEL, University Cote d'Azur, CNRS, Inria
# Licensed under the Apache License, Version 2.0 (http://www.apache.org/licenses/LICENSE-2.0)

# This script requires an $isql_dba variable set like this:
isql_dba="$VIRTUOSO/bin/isql -H localhost -U dba -P your_password"

help()
{
  echo
  echo "$0 imports a set of RDF files as a named graph into Virtuoso."
  echo
  echo "Usage:"
  echo "$0 --graph <graph URI> [--cleargraph] [--path <path of data files>] file1 file2 ... fileN"
  echo "$0 [-h|--help]"
  echo
  echo "Path defaults to current directory if not provided."
  echo "If option --cleargraph is mentioned, the graph is cleared before importing files."
  echo
  exit 1
}

# Default path is current directory
path=`pwd`

while [ "$1" == "--graph" -o  "$1" == "--path" -o  "$1" == "--cleargraph" ]; do
  case "$1" in
    --graph ) graph=$2; shift;;
    --path ) path=$2; shift;;
    --cleargraph ) cleargraph=1;;
    -h | --help ) help;;
    *) echo "### ERROR: allowed parameters are '--graph <graph URI>', '--cleargraph' and '--path <path>'"; help;;
  esac
  shift
done

if [ -z "$graph" ]; then
    echo "Graph URI must be provided with option --graph."
    help
fi


#--- Prepare isql command file
tempfile=temp.${$}.isql
echo -n "" > $tempfile

if [ ! -z "$cleargraph" ]; then
    echo "SPARQL CLEAR GRAPH  <${graph}>;" >> $tempfile
fi

echo "delete from DB.DBA.LOAD_LIST;" >> $tempfile
while [ ! -z "$1" ]; do
    echo "ld_dir ('${path}', '$1', '${graph}');" >> $tempfile
    shift
done

echo "rdf_loader_run();"  >> $tempfile
cat $tempfile

#--- Run file against isql
cat $tempfile | $isql_dba

rm -f $tempfile
