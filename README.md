# FRESH Bioprinter — Ender 5 Pro Conversion

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/)
[![DOI](https://zenodo.org/badge/1205548614.svg)](https://doi.org/10.5281/zenodo.19479380)

Open-source design files for the conversion of a Creality Ender 5 Pro desktop 3D printer into a syringe extrusion bioprinter capable of FRESH (Freeform Reversible Embedding of Suspended Hydrogels) 3D bioprinting. Developed as part of a group project at the Department of Bioengineering, Imperial College London, under the supervision of Dr Ben Almquist.

The extruder is a modified Replistruder 5, with a GT2 belt drive replacing the original planetary gearbox to reduce mechanical dead zone,  an anti-backlash nut and preloaded carriage sliders to minimise axial freeplay. Motion control is provided by a Duet 3 Mainboard 6HC running RepRapFirmware 3.6.0.

---

## Contributors

**Magor Pocsveiler** — extruder design, firmware, mechanical build  
**Vera Rachkova** — extruder design, mechanical build, 
**Junyuan Guan** — [role]  
**Hui Sin Phang** — [role]  
**Hannah Seo** — [role]  
**Saad S Ayub** — [role]  
**Zifeng T Guo** — [role]  
**Ricky Zhang** — [role]  

**Supervisor:** Dr Ben Almquist, Department of Bioengineering, Imperial College London

---

## Repository Structure

```
├── CAD/
│   ├── STEP/          # Neutral format — open without Fusion 360
│   ├── STL/           # Print-ready files
│   └── Fusion/        # Native .f3d files
├── Firmware/
│   └── config/        # RepRapFirmware configuration files for Duet 3 6HC
├── Slicing/
│   └── CuraProfile/   # Ultimaker Cura profile for bioprinting
└── README.md
```

---

## Hardware

| Component | Details |
|---|---|
| Base printer | Creality Ender 5 Pro |
| Motion controller | Duet 3 Mainboard 6HC v1.02 + Duet 3 WiFi module |
| Extruder | Modified Replistruder 5 |
| Drive train | GT2 belt, 16T/48T pulleys (3:1 reduction), TR8×1.5 leadscrew |
| Syringe | Hamilton 1001 TLL (1 mL, PTFE luer-lock) |
| Needles | 34G (~90 µm ID) for acellular collagen; 30G (~150 µm ID) for cell-containing bioinks |
| Printed parts | PETG, Bambu Labs A1 |

---

## Modifications to the Replistruder 5

- Planetary gearbox and NEMA 11 replaced with GT2 belt drive and salvaged Ender 5 Pro NEMA 17
- Anti-backlash nut replacing standard TR8 lead nut
- Preloaded linear carriage sliders
- Screw-actuated belt tensioner with slotted motor mount and M3 lock screws
- TR8×1.5 leadscrew turned down on lathe (ends reduced to 5 mm, flat milled for set screw)
- Custom PETG adapter plate for mounting to Ender 5 Pro X-axis carriage

---

## Firmware

RepRapFirmware 3.x configured for Ender 5 Pro Cartesian kinematics on a Duet 3 6HC. Key parameters:

| Axis | Steps/mm | Microstepping | Max Speed | Acceleration |
|---|---|---|---|---|
| X | 80 | 64× | 30 mm/s | 50 mm/s² |
| Y | 80 | 64× | 30 mm/s | 50 mm/s² |
| Z | 400 | 16× | 10 mm/s | 20 mm/s² |
| E0 | 6400 | 16× | 5 mm/s | 10 mm/s² |

WiFi configured in access point mode (SSID: "FRESH Bioprinter", IP: 192.168.50.1).

Configuration files are in `/Firmware/config/`. Adapted from the open-source FF Finder bioprinter configuration published by the Shiwarski Tissue Engineering Lab (Zenodo DOI: [10.5281/zenodo.7496012](https://doi.org/10.5281/zenodo.7496012)).

---

## Slicing

Structures were sliced in Ultimaker Cura. The Cura profile is provided in `/Slicing/CuraProfile/`. Key print parameters:

| Parameter | Value | Rationale |
|---|---|---|
| Retraction distance | 0.05 mm | Prevents oozing at move boundaries |
| Z-hop | Enabled | Avoids disturbance of printed structures during travel |
| End retraction | 2 mm relative | Decompresses fluid column after print |
| X/Y microstepping | 64× | Increased positioning resolution |

---

## Bill of Materials

### Extruder & Motion Components (Magor Pocsveiler)

| Item | Qty | Supplier | Part No. | Link |
|---|---|---|---|---|
| TR8×1.5 Lead Screw Nut (Anti-backlash) | 1 | IGUS | JFRM-LC-0001-TR8X1.5 | [Link](https://www.igus.co.uk/articlerouter?artnr=JFRM-LC-0001-TR8X1.5) |
| TR8×1.5 Lead Screw 1000mm | 1 | IGUS | PTGSG-08X1.5-01-R-ES | [Link](https://www.igus.co.uk/articlerouter?artnr=PTGSG-08X1.5-01-R-ES) |
| Rail Carriage (Preloaded) | 2 | IGUS | NW-01-27-P | [Link](https://www.igus.co.uk/articlerouter?artnr=NW-01-27-P) |
| Rail 100mm | 1 | IGUS | NS-01-27 | [Link](https://www.igus.co.uk/articlerouter?artnr=NS-01-27) |
| Plain Flange Bearing | 2 | RS Components | 2725067 | [Link](https://uk.rs-online.com/web/p/products/2725067) |
| Plain Bearing | 2 | RS Components | 2725190 | [Link](https://uk.rs-online.com/web/p/products/2725190) |
| M3 Washers (pack of 100) | 1 | RS Components | 189620 | [Link](https://uk.rs-online.com/web/p/products/189620) |
| M3 Thin Nuts (pack of 250) | 1 | RS Components | 4830338 | [Link](https://uk.rs-online.com/web/p/products/4830338) |
| M3×0.5 16mm Socket Head (pack of 200) | 1 | RS Components | 4679818 | [Link](https://uk.rs-online.com/web/p/products/4679818) |
| M4×0.7 8mm Countersunk Head (pack of 100) | 1 | RS Components | 281215 | [Link](https://uk.rs-online.com/web/p/products/281215) |
| M4 Nuts (pack of 250) | 1 | RS Components | 525896 | [Link](https://uk.rs-online.com/web/p/products/525896) |
| 5mm Radial Bearing | 1 | RS Components | 74776 | [Link](https://uk.rs-online.com/web/p/products/74776) |
| Thrust Bearing 8mm Bore | 2 | Gears and Sprockets | 4255-282 | — |
| GT2 48T Pulley | 1 | Gears and Sprockets | 6001-061 | — |
| GT2 16T Pulley | 1 | Gears and Sprockets | 6001-001 | — |
| Duet 3 6HC Mainboard | 1 | Ooznest | — | [Link](https://ooznest.co.uk) |
| Duet 3 WiFi Module | 1 | Ooznest | — | [Link](https://ooznest.co.uk) |

### Consumables & Wet Lab (Vera Rachkova & Junyuan Guan)

| Item | Qty | Supplier | Part No. | Link |
|---|---|---|---|---|
| Hamilton 1000 Series Gastight Syringe TLL 1mL | 1 | Fisher Scientific UK | 81320 | [Link](https://www.fishersci.co.uk/shop/products/hamilton-1000-series-gastight-syringes-luer-lock-syringes-tll-termination-14/10772361) |
| 34G Dispensing Needle Techcon (pack of 50) | 1 | Adhesive Dispensing Ltd | TE734025PK | [Link](https://www.adhesivedispensing.co.uk/34g-precision-te-general-purpose-tip-lime-te734-9607-p.asp) |
| 30G Dispensing Needle Techcon (pack of 50) | 1 | Adhesive Dispensing Ltd | TE730050PK | [Link](https://www.adhesivedispensing.co.uk/30g-precision-te-general-purpose-tip-lavender-te730-9544-p.asp) |
| Blender (gelatin microparticle preparation) | 1 | Argos | — | [Link](https://www.argos.co.uk/product/2849520) |
| Gelatin from porcine skin, ~300 Bloom, Type A BioReagent (100g) | 1 | Sigma-Aldrich UK | G1890-100G | [Link](https://www.sigmaaldrich.com/GB/en/product/sigma/g1890) |
| Cell Strainer 40 µm nylon mesh, sterile (pack of 50) | 1 | Sigma-Aldrich UK | CLS431750 | [Link](https://www.sigmaaldrich.com/GB/en/product/sigma/cls431750) |

---

## Dependencies

- [RepRapFirmware 3.x](https://github.com/Duet3D/RepRapFirmware)
- [Ultimaker Cura](https://ultimaker.com/software/ultimaker-cura) (open-source)
- [Fusion 360](https://www.autodesk.com/products/fusion-360) (for native CAD files; STEP files provided for licence-free access)

---

## Related Publications

- Shiwarski, D.J. et al. "3D bioprinting of collagen-based high-resolution internally perfusable scaffolds for engineering fully biologic tissue systems." *Science Advances*, 2025. DOI: [10.1126/sciadv.adu5905](https://doi.org/10.1126/sciadv.adu5905)
- Tashman, J.W., Shiwarski, D.J., Feinberg, A.W. "A high performance open-source syringe extruder optimized for extrusion and retraction during FRESH 3D bioprinting." *HardwareX*, 2021, 9:e00170. DOI: [10.1016/j.ohx.2020.e00170](https://doi.org/10.1016/j.ohx.2020.e00170)
- Replistruder 5 design files: Zenodo DOI: [10.5281/zenodo.7135874](https://doi.org/10.5281/zenodo.7135874)
- FF Finder bioprinter config: Zenodo DOI: [10.5281/zenodo.7496012](https://doi.org/10.5281/zenodo.7496012)

---

## Acknowledgements

The extruder design presented here is derived from the Replistruder 5, developed by Joshua W. Tashman and Daniel J. Shiwarski in the Regenerative Biomaterials and Therapeutics Group, Department of Biomedical Engineering, Carnegie Mellon University, Pittsburgh, PA, USA, under the supervision of Professor Adam W. Feinberg. The original design files are archived at https://doi.org/10.5281/zenodo.7135874 and are released under a CC-BY-SA 4.0 licence. This work is likewise released under CC-BY-SA 4.0 in accordance with the terms of that licence.

---

## Licence

This work is licensed under Creative Commons Attribution-ShareAlike 4.0 International (CC-BY-SA 4.0). See [LICENSE](LICENSE) for the full licence text.

[![License: CC BY-SA 4.0](https://licensebuttons.net/l/by-sa/4.0/88x31.png)](https://creativecommons.org/licenses/by-sa/4.0/)
