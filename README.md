# app-crop_reorient
This application will crop and reorient the nifti image to standard orientation and FOV.

[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.15-blue.svg)](https://doi.org/10.25663/bl.app.15)

### Author
- Lindsey Kitchell (kitchell@indiana.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://brainlife.io/app/5a0f38bf31769f1e4d46cc58](https://brainlife.io/app/5a0f38bf31769f1e4d46cc58)v via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "t1": ../ti.nii.gz
}
```
3. Execute the main file via command line

### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

The  output of this App is the cropped/reoriented T1 image. 


### Dependencies

This App require FSL to run. FSL can be obtained from [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL).
