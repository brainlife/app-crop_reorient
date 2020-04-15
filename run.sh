#!/bin/bash

rm -f out.nii.gz

input=$(jq -r .input config.json)

cp $input out.nii.gz
chmod +w out.nii.gz

if [ $(jq -r .reorient config.json) == true ]; then
	fslreorient2std out.nii.gz out.nii.gz
fi

if [ $(jq -r .crop config.json) == true ]; then
	robustfov -i out.nii.gz -r out.nii.gz
fi


