# Release Notes — v0.1.0 (Initial Zenodo Deposit)

**Date:** 2026-04-09  
**Status:** Initial public archive — further revisions planned

---

## Overview

This is the first archived release of the FRESH Bioprinter design files developed at the Department of Bioengineering, Imperial College London, under the supervision of Dr Ben Almquist. The repository contains the hardware design, firmware configuration, and slicing profile for converting a Creality Ender 5 Pro desktop 3D printer into a syringe extrusion bioprinter capable of FRESH (Freeform Reversible Embedding of Suspended Hydrogels) 3D bioprinting.

The extruder is a derivative of the Replistruder 5 (Tashman et al., *HardwareX* 2021; Zenodo: 10.5281/zenodo.7135874), modified to replace the original planetary gearbox with a GT2 belt drive, and to incorporate an anti-backlash nut and preloaded carriage sliders. Motion control is provided by a Duet 3 Mainboard 6HC running RepRapFirmware 3.6.0.

---

## Contents of This Release

| Directory | Contents |
|---|---|
| `CAD/Fusion/` | Native Autodesk Fusion 360 design files (`.f3d`, `.f3z`) |
| `CAD/STEP/` | Neutral-format STEP files for licence-free CAD access |
| `CAD/STL/` | Print-ready STL files for all custom printed parts |
| `Firmware/config/` | RepRapFirmware 3.x configuration for Duet 3 6HC (zipped) |
| `Slicing/CuraProfile/` | Ultimaker Cura profile optimised for syringe extrusion |

---

## Known Limitations and Pending Work

This release is an initial deposit made to establish a citable DOI for the project record. The following items are incomplete or subject to revision in subsequent releases:

- **Contributor roles** — several contributor descriptions in `README.md` are placeholders pending confirmation from team members.
- **Project report** — `Report Place Holder.pdf` is a placeholder; the final project report will replace this in a future release.
- **CAD completeness** — the enclosure assembly (`FBP-ENC-00-V1A`) is at revision V1A and may be updated as the design is refined.
- **Firmware** — configuration files are provided as an unversioned zip archive; individual files and version tagging will be added in future releases.
- **Bill of materials** — some supplier part numbers and links are listed as approximate or without a part number (e.g. Duet 3 boards from Ooznest, thrust bearings from Gears and Sprockets); these will be confirmed in subsequent releases.
- **Zenodo DOI** — the DOI badge in `README.md` contains a placeholder (`zenodo.TODO`) that will be updated once the Zenodo record is published.

Users requiring a fully validated, stable release should await a subsequent version. This deposit is intended to establish provenance and enable citation during the project's active development phase.

---

## Versioning

Releases will follow semantic versioning (`MAJOR.MINOR.PATCH`):

- `v0.x.x` — development releases; files and design decisions may change without backwards compatibility guarantees.
- `v1.0.0` — first stable release, corresponding to the finalised project submission.

---

## How to Cite

If you use these files, please cite this Zenodo record directly. A suggested citation will appear on the Zenodo landing page once the DOI is activated.

This work is derived from the Replistruder 5; please also cite:

> Tashman, J.W., Shiwarski, D.J., Feinberg, A.W. "A high performance open-source syringe extruder optimized for extrusion and retraction during FRESH 3D bioprinting." *HardwareX*, 2021, 9:e00170. DOI: [10.1016/j.ohx.2020.e00170](https://doi.org/10.1016/j.ohx.2020.e00170)

---

## Licence

CC-BY-SA 4.0 — see `LICENSE` for full text. Derivative works must be released under the same licence, in accordance with the upstream Replistruder 5 licence terms.
