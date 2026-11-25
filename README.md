# app-crop_reorient

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Reorients a FLAIR image to the standard (MNI152) orientation with FSL fslreorient2std and crops the lower head and neck with robustfov.**

Runs fslreorient2std and then robustfov on the input FLAIR image; either step can be switched off. Use it early in anatomical preprocessing so later steps see a standard-oriented, tightly cropped head. It only reorients and crops; it does not register the image to a template.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.704](https://doi.org/10.25663/brainlife.app.704)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `input` | `neuro/anat/flair` | yes | FLAIR image. |

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/flair` | The reoriented and/or cropped FLAIR image. |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `reorient` | boolean | `true` | Run fslreorient2std. This command reorients an image to match the orientation of the standard template images (MNI152) so that they appear "the same way around" in FSLView. It requires that the image labels are correct in FSLView before this is run. It is also not a registration tool, so it will not align the image to standard space, it will only apply 90, 180 or 270 degree rotations about the different axes as necessary to get the labels in the same position as the standard template. |
| `crop` | boolean | `true` | Run robustfov to reduce field-of-view of image to remove lower head and neck. |

Runtime: container `brainlife/fsl:6.0.4-patched2`; 1 CPUs; 8 GB memory; 2 h walltime.

<!-- brainlife-app:end -->

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
