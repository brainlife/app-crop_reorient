<h1 align="center">FSL Reorient and Crop</h1>

<p align="center">
  T1-weighted, T2-weighted, FLAIR or task fMRI images reoriented to the standard (MNI152) orientation and, for anatomical images, cropped to remove the lower head and neck.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.704"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.704-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> **This branch, `2.0`, runs 4 brainlife.io Apps** that share the same code:
>
> - FSL Reorient and Crop FLAIR ([doi:10.25663/brainlife.app.704](https://doi.org/10.25663/brainlife.app.704))
> - FSL Reorient - Task ([doi:10.25663/brainlife.app.502](https://doi.org/10.25663/brainlife.app.502))
> - FSL Reorient and Crop T2 ([doi:10.25663/brainlife.app.501](https://doi.org/10.25663/brainlife.app.501))
> - FSL Reorient and Crop T1 ([doi:10.25663/brainlife.app.500](https://doi.org/10.25663/brainlife.app.500))
>
> The other Apps in this repository are listed under **Versions on brainlife.io** below.

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

### FSL Reorient and Crop FLAIR

> **Reorients a FLAIR image to the standard (MNI152) orientation with FSL fslreorient2std and crops the lower head and neck with robustfov.**

Runs fslreorient2std and then robustfov on the input FLAIR image; either step can be switched off. Use it early in anatomical preprocessing so later steps see a standard-oriented, tightly cropped head. It only reorients and crops; it does not register the image to a template.

| | |
|---|---|
| **Inputs** | `neuro/anat/flair` |
| **Outputs** | `neuro/anat/flair` |
| **Container** | `brainlife/fsl:6.0.4-patched2` |
| **Resources** | 1 CPUs · 8 GB memory · 2 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.704](https://doi.org/10.25663/brainlife.app.704) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `input` | `neuro/anat/flair` | yes | FLAIR image. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/flair` | The reoriented and/or cropped FLAIR image. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `reorient` | boolean | `true` | Run fslreorient2std. This command reorients an image to match the orientation of the standard template images (MNI152) so that they appear "the same way around" in FSLView. It requires that the image labels are correct in FSLView before this is run. It is also not a registration tool, so it will not align the image to standard space, it will only apply 90, 180 or 270 degree rotations about the different axes as necessary to get the labels in the same position as the standard template. |
| `crop` | boolean | `true` | Run robustfov to reduce field-of-view of image to remove lower head and neck. |

</details>

### FSL Reorient - Task

> **Reorients a task fMRI series to the standard (MNI152) orientation with FSL fslreorient2std, passing events, sbref and physio files through.**

Runs fslreorient2std on the BOLD image and copies every other file of the input (events, sbref, physio and their sidecars) to the output unchanged. Cropping (robustfov) is meant for anatomical images and is off by default. It only reorients; it does not register or resample to a template.

| | |
|---|---|
| **Inputs** | `neuro/func/task` |
| **Outputs** | `neuro/func/task` |
| **Container** | `brainlife/fsl:6.0.4-patched2` |
| **Resources** | 1 CPUs · 8 GB memory · 2 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.502](https://doi.org/10.25663/brainlife.app.502) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `input` | `neuro/func/task` | yes | Task fMRI datatype: BOLD series plus optional events, sbref and physio files with JSON sidecars. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/func/task` | The task fMRI datatype with the reoriented BOLD image and the other files copied unchanged. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `reorient` | boolean | `true` | Run fslreorient2std on the BOLD image. |
| `crop` | boolean | `false` | Run robustfov on the BOLD image; only meant for T1/T2 images, leave false. |

</details>

### FSL Reorient and Crop T2

> **Reorients a T2-weighted image to the standard (MNI152) orientation with FSL fslreorient2std and crops the lower head and neck with robustfov.**

Runs fslreorient2std and then robustfov on the input T2-weighted image; either step can be switched off. Use it early in anatomical preprocessing so later steps see a standard-oriented, tightly cropped head. It only reorients and crops; it does not register the image to a template.

| | |
|---|---|
| **Inputs** | `neuro/anat/t2w` |
| **Outputs** | `neuro/anat/t2w` |
| **Container** | `brainlife/fsl:6.0.4-patched2` |
| **Resources** | 1 CPUs · 8 GB memory · 2 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.501](https://doi.org/10.25663/brainlife.app.501) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `input` | `neuro/anat/t2w` | yes | T2-weighted image. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/t2w` | The reoriented and/or cropped T2-weighted image. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `reorient` | boolean | `true` | Run fslreorient2std to reorient the T2 to the standard (MNI152) orientation. |
| `crop` | boolean | `true` | Run robustfov to crop the field of view and remove the lower head and neck. |

</details>

### FSL Reorient and Crop T1

> **Reorients a T1-weighted image to the standard (MNI152) orientation with FSL fslreorient2std and crops the lower head and neck with robustfov.**

Runs fslreorient2std and then robustfov on the input T1-weighted image; either step can be switched off. Use it early in anatomical preprocessing so later steps see a standard-oriented, tightly cropped head. It only reorients and crops; it does not register the image to a template.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/anat/t1w` |
| **Container** | `brainlife/fsl:6.0.4-patched2` |
| **Resources** | 1 CPUs · 8 GB memory · 2 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.500](https://doi.org/10.25663/brainlife.app.500) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `input` | `neuro/anat/t1w` | yes | T1-weighted image. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/t1w` | The reoriented and/or cropped T1-weighted image. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `reorient` | boolean | `true` | Run fslreorient2std. This command reorients an image to match the orientation of the standard template images (MNI152) so that they appear "the same way around" in FSLView. It requires that the image labels are correct in FSLView before this is run. It is also not a registration tool, so it will not align the image to standard space, it will only apply 90, 180 or 270 degree rotations about the different axes as necessary to get the labels in the same position as the standard template. |
| `crop` | boolean | `true` | Run robustfov to reduce field-of-view of image to remove lower head and neck. |

</details>

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts one App per input datatype; each is registered on brainlife.io from a branch of this repository.

| App | Input | FSL | Branch | Run it | Status |
|---|---|---|---|---|---|
| **FSL Reorient and Crop FLAIR** (this branch) | `neuro/anat/flair` | 6.0.4-patched2 | [`2.0`](https://github.com/brainlife/app-crop_reorient/tree/2.0) | [doi:10.25663/brainlife.app.704](https://doi.org/10.25663/brainlife.app.704) | current |
| **FSL Reorient and Crop T1** (this branch) | `neuro/anat/t1w` | 6.0.4-patched2 | [`2.0`](https://github.com/brainlife/app-crop_reorient/tree/2.0) | [doi:10.25663/brainlife.app.500](https://doi.org/10.25663/brainlife.app.500) | current |
| **FSL Reorient and Crop T2** (this branch) | `neuro/anat/t2w` | 6.0.4-patched2 | [`2.0`](https://github.com/brainlife/app-crop_reorient/tree/2.0) | [doi:10.25663/brainlife.app.501](https://doi.org/10.25663/brainlife.app.501) | current |
| **FSL Reorient - Task** (this branch) | `neuro/func/task` | 6.0.4-patched2 | [`2.0`](https://github.com/brainlife/app-crop_reorient/tree/2.0) | [doi:10.25663/brainlife.app.502](https://doi.org/10.25663/brainlife.app.502) | current |
| Crop and Reorient T1 | `neuro/anat/t1w` | 5.0.9 | [`1.0`](https://github.com/brainlife/app-crop_reorient/tree/1.0) | [doi:10.25663/bl.app.15](https://doi.org/10.25663/bl.app.15) | deprecated |
| Crop and Reorient T2 | `neuro/anat/t2w` | 5.0.9 | [`1.0`](https://github.com/brainlife/app-crop_reorient/tree/1.0) | [doi:10.25663/brainlife.app.114](https://doi.org/10.25663/brainlife.app.114) | deprecated |

## Running the App

### On brainlife.io

Open the App for your datatype from the table above, choose the image from your project and press **Execute**. The App:

1. runs `fslreorient2std` to reorient the image to match the orientation of the standard (MNI152) template images (`reorient`, default on);
2. runs `robustfov` to reduce the field of view and remove the lower head and neck (`crop`, default on for T1, T2 and FLAIR).

Either step can be switched off. The output has the same datatype as the input, tagged `crop_reorient`. Use it early in anatomical preprocessing so later steps see a standard-oriented, tightly cropped head. The App only reorients and crops; it does not register or resample the image to a template.

For task fMRI, only the BOLD image is reoriented; events, sbref and physio files and their JSON sidecars are copied through unchanged. Cropping is meant for anatomical images; leave `crop` off for fMRI.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). FSL runs inside the container.

1. Clone this repository and check out the branch brainlife.io runs: `git checkout 2.0`.
2. Create `config.json` with the path to your image and the steps you want:

   ```json
   {
       "input": "/input/t1/t1.nii.gz",
       "reorient": true,
       "crop": true
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

### Sample data

Download sample datasets from brainlife.io with the [brainlife CLI](https://github.com/brainlife/cli):

```bash
npm install -g brainlife
bl login
bl dataset download <dataset-id>
```

## Outputs

```text
out/
├── <input name>.nii.gz   the reoriented and/or cropped image
└── …                     every other file in the input directory (sidecars, events, sbref, physio), unchanged
```

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- FSL Reorient and Crop FLAIR. brainlife.io App. [doi:10.25663/brainlife.app.704](https://doi.org/10.25663/brainlife.app.704)
- FSL Reorient - Task. brainlife.io App. [doi:10.25663/brainlife.app.502](https://doi.org/10.25663/brainlife.app.502)
- FSL Reorient and Crop T2. brainlife.io App. [doi:10.25663/brainlife.app.501](https://doi.org/10.25663/brainlife.app.501)
- FSL Reorient and Crop T1. brainlife.io App. [doi:10.25663/brainlife.app.500](https://doi.org/10.25663/brainlife.app.500)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Lindsey Kitchell

**Contributors:** Soichi Hayashi, Brad Caron, Franco Pestilli

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE). FSL itself is distributed under its own [license](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Licence).
