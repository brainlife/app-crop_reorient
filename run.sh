#!/bin/bash

set -e
set -x

input=$(jq -r .input config.json)

if [ $(jq -r .reorient config.json) == true ]; then
    fslreorient2std $input tmp1.nii.gz
else
    ln -sf $input tmp1.nii.gz
fi

if [ $(jq -r .crop config.json) == true ]; then
    robustfov -i tmp1.nii.gz -r tmp2.nii.gz
else
    ln -sf tmp1.nii.gz tmp2.nii.gz
fi

#copy all other files - like sbred,events,bvec,bval,etc..
mkdir -p out
cp -r $(dirname $input)/* out/

ln -sf ../tmp2.nii.gz out/$(basename $input)
