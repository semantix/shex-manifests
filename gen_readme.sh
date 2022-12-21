#!/bin/bash
# ############################
# author: Deepak Sharma
# email: m2dks@yahoo.com
# ############################
#
DIR=.
source $DIR/examples.sh

# Script to generate README.md

FILE_NAME=README.md
SHEX_VALIDATOR=http://shex.io/webapps/shex.js/doc/shex-simple?manifestURL=
SHEX_MANIFEST=https://semantix.github.io/shex-manifests
NEW_WINDOW="{:target=\"_blank\" rel=\"noopener\"}"

echo "# ShEx-mainfests" > $FILE_NAME
echo "Manifest tests and examples for FHIR ShEx" >> $FILE_NAME
echo " " >> $FILE_NAME
echo "[Try it](fhircat.github.io/FHIR-ShEx-manifests/-fhir-constraints.yaml)" >> $FILE_NAME
echo "| Example | Description |" >> $FILE_NAME
echo "| ------- | ----------- |" >> $FILE_NAME

for exmp in "${examples[@]}"
do
	IFS='#' read -r -a exmpstrs <<< "$exmp"
	LINK1="| [${exmpstrs[0]}]($SHEX_VALIDATOR$SHEX_MANIFEST/${exmpstrs[0]}/${exmpstrs[0]}.yaml) "
	LINK2="| ${exmpstrs[1]} |"
	echo  ${LINK1}${NEW_WINDOW}${LINK2} >> $FILE_NAME
done



