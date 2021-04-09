#!/bin/bash

set -e
set -x

input=$(jq -r .input config.json)

if [ $(jq -r .reorient config.json) == true ]; then
    fslreorient2std $input tmp1.nii.gz
else
    ln -s $input tmp1.nii.gz
fi

if [ $(jq -r .crop config.json) == true ]; then
    robustfov -i tmp1.nii.gz -r tmp2.nii.gz
else
    ln -s tmp1.nii.gz tmp2.nii.gz
fi

[ $(basename $input) == "t1.nii.gz" ] && outname=out/t1.nii.gz
[ $(basename $input) == "t2.nii.gz" ] && outname=out/t2.nii.gz
[ $(basename $input) == "bold.nii.gz" ] && outname=out/bold.nii.gz

mkdir -p out
ln -s ../tmp2.nii.gz $outname
