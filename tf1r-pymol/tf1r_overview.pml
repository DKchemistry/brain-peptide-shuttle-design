# tfR1_structural_context.pml
# Reproduce the TfR1 structural-context analysis used in this session.
#
# Chain map used here:
#   6WRW: A/B = TfR1 ectodomain; C/D = Baker-lab binder 2DS25.5
#   3S9L: A/B = TfR1 ectodomain; C/D = transferrin
#   AF3:  A/B = full-length TfR1; C/D = mature transferrin
#         remaining chains = requested small-molecule/ion components
#
# IMPORTANT:
# Edit the AF3 load line below to point to your local AlphaFold 3 CIF.

set auto_zoom, off

# -------------------------------------------------------------------------
# 1. LOAD STRUCTURES
# -------------------------------------------------------------------------

fetch 6wrw, 6WRW, async=0
fetch 3s9l, 3S9L, async=0

# EDIT THIS PATH:
load fold_tfrc2_tf2_holo_ca2_fe4_co3x4_model_0.cif, AF3_TfR1_Tf

# -------------------------------------------------------------------------
# 2. DEFINE THE COLOR PALETTE
# -------------------------------------------------------------------------

set_color domain_apical,   [0.88, 0.60, 0.68]
set_color domain_protease, [0.58, 0.72, 0.84]
set_color domain_helical,  [0.58, 0.76, 0.62]

set_color domain_stalk,    [0.78, 0.78, 0.76]
set_color domain_TM,       [0.48, 0.49, 0.50]
set_color domain_cyto,     [0.68, 0.62, 0.74]

set_color design_gray,     [0.72, 0.73, 0.72]
set_color design_teal,     [0.38, 0.72, 0.72]
set_color pastel_tf,       [0.82, 0.76, 0.62]

set_color hetero_O,        [0.85, 0.28, 0.30]
set_color hetero_N,        [0.30, 0.45, 0.78]
set_color hetero_S,        [0.88, 0.72, 0.25]
set_color hetero_P,        [0.90, 0.50, 0.25]

set_color cofactor_Ca,     [0.45, 0.75, 0.82]
set_color cofactor_Fe,     [0.88, 0.48, 0.25]
set_color cofactor_CO3,    [0.78, 0.78, 0.78]

# -------------------------------------------------------------------------
# 3. PUT EVERYTHING INTO THE SAME TfR1 REFERENCE FRAME
# -------------------------------------------------------------------------

super (3S9L and chain A and polymer.protein), (6WRW and chain A and polymer.protein)
super (AF3_TfR1_Tf and chain A and resi 121-760 and polymer.protein), (6WRW and chain A and polymer.protein)

# -------------------------------------------------------------------------
# 4. COLOR THE EXPERIMENTAL TfR1 ECTODOMAIN (6WRW)
# -------------------------------------------------------------------------

color domain_protease, (6WRW and chain A and polymer.protein and (resi 121-188 or resi 384-606))
color domain_apical,   (6WRW and chain A and polymer.protein and resi 189-383)
color domain_helical,  (6WRW and chain A and polymer.protein and resi 607-760)

color design_gray, (6WRW and chain B and polymer.protein)
color design_teal, (6WRW and chain C+D and polymer.protein)

# -------------------------------------------------------------------------
# 5. COLOR TRANSFERRIN FROM THE EXPERIMENTAL COMPLEX
# -------------------------------------------------------------------------

color pastel_tf, (3S9L and chain C+D and polymer.protein)

# -------------------------------------------------------------------------
# 6. COLOR THE FULL-LENGTH AF3 MODEL
# -------------------------------------------------------------------------

color domain_cyto,     (AF3_TfR1_Tf and chain A+B and polymer.protein and resi 1-67)
color domain_TM,       (AF3_TfR1_Tf and chain A+B and polymer.protein and resi 68-88)
color domain_stalk,    (AF3_TfR1_Tf and chain A+B and polymer.protein and resi 89-120)
color domain_protease, (AF3_TfR1_Tf and chain A+B and polymer.protein and (resi 121-188 or resi 384-606))
color domain_apical,   (AF3_TfR1_Tf and chain A+B and polymer.protein and resi 189-383)
color domain_helical,  (AF3_TfR1_Tf and chain A+B and polymer.protein and resi 607-760)

color pastel_tf, (AF3_TfR1_Tf and chain C+D and polymer.protein)

color cofactor_Ca,  (AF3_TfR1_Tf and resn CA and not polymer)
color cofactor_Fe,  (AF3_TfR1_Tf and resn FE and not polymer)
color cofactor_CO3, (AF3_TfR1_Tf and resn CO3)
color hetero_O,     (AF3_TfR1_Tf and resn CO3 and elem O)

# -------------------------------------------------------------------------
# 7. DEFAULT DISPLAY FOR ORIENTING YOURSELF
# -------------------------------------------------------------------------

hide everything, all

show surface, (6WRW and chain A and polymer.protein)
show cartoon, (6WRW and chain B and polymer.protein)
show surface, (6WRW and chain C+D and polymer.protein)

show surface, (3S9L and chain C+D and polymer.protein)

show cartoon, (AF3_TfR1_Tf and chain A+B and polymer.protein)

# AF3 transferrin hidden by default to avoid duplicating experimental Tf:
# show cartoon, (AF3_TfR1_Tf and chain C+D and polymer.protein)

show spheres, (AF3_TfR1_Tf and resn CA+FE and not polymer)
show sticks,  (AF3_TfR1_Tf and resn CO3)

set cartoon_transparency, 0.35, (AF3_TfR1_Tf and chain A+B and polymer.protein)

# Clean rendering defaults
set antialias, 2
set ray_shadows, off
set specular, 0
set ambient, 0.45
set direct, 0.55
set reflect, 0.15

zoom (6WRW or 3S9L or AF3_TfR1_Tf), complete=1

scene init, store

# hide unstructured AF3 
hide everything, AF3_TfR1_TF and chain A and resi 1-88
hide everything, AF3_TfR1_TF and chain B and resi 1-88

set_view (\
     0.340186834,    0.940337002,    0.001639045,\
     0.828025877,   -0.300371706,    0.473392040,\
     0.445649415,   -0.159690350,   -0.880826235,\
    -0.000327796,   -0.000860164, -472.333496094,\
    19.271650314,  -13.782587051,   38.265354156,\
   322.191619873,  622.614990234,  -20.000000000 )

scene af3_domains, store

set_view (\
     0.034455318,    0.939706922,   -0.340186834,\
     0.462620825,   -0.316709906,   -0.828025937,\
    -0.885862827,   -0.128852636,   -0.445649385,\
    -0.000327796,   -0.000860164, -472.333496094,\
    19.271650314,  -13.782587051,   38.265354156,\
   322.191619873,  622.614990234,  -20.000000000 )

scene af3_domains_rotate, store

disable all
enable 6WRW
enable 3S9L

# TfR1 homodimer: color both chains A and B identically by domain

color domain_protease, (6WRW and chain A+B and (resi 121-188 or resi 384-606))
color domain_apical,   (6WRW and chain A+B and resi 189-383)
color domain_helical,  (6WRW and chain A+B and resi 607-760)

# Baker binder copies
color design_teal, (6WRW and chain C+D)

set_view (\
    -0.107732557,    0.939150333,    0.326113820,\
    -0.561253726,   -0.328192592,    0.759754598,\
     0.820577383,   -0.101184011,    0.562471688,\
    -0.001934454,   -0.002376184, -433.734161377,\
    45.967712402,  -25.064382553,   38.638164520,\
   283.536468506,  583.959838867,  -20.000000000 )

scene sahoe_surface, store

set transparency, 0.5

set_view (\
     0.308727503,    0.621911407,    0.719630837,\
    -0.587039530,   -0.470678985,    0.658622324,\
     0.748344719,   -0.625802517,    0.219782248,\
    -0.005573124,   -0.002450086,  -90.711349487,\
    75.293922424,  -56.623043060,   66.660110474,\
  -100.033111572,  254.790725708,  -20.000000000 )

scene sahoe_extension, store

set_view (\
     0.308727503,    0.621911407,    0.719630837,\
    -0.587039530,   -0.470678985,    0.658622324,\
     0.748344719,   -0.625802517,    0.219782248,\
    -0.005573124,   -0.002450086,  -90.711349487,\
    75.293922424,  -56.623043060,   66.660110474,\
  -100.033111572,  254.790725708,  -20.000000000 )

scene sahoe_ext_zoom, store

# set ray_trace_mode, 1
# ray 2000,2000
# png sahoe_extension

python
import os

script_dir = os.path.dirname(os.path.abspath(__script__))

for i in range(5):
    pdb = os.path.join(
        script_dir,
        "..",
        "proof-of-concept",
        "rfd_tf1r_macrocycle",
        "mps",
        f"tfr1_macrocycle_res_209-212_{i}.pdb",
    )
    cmd.load(pdb, f"tfr1_macrocycle_209-212_{i}")
    cmd.align(f"tfr1_macrocycle_209-212_{i} and Chain A", "6WRW and Chain A")
python end

# ray 5000, 1000

disable all
enable tfr1_macrocycle_209-212_0
enable tfr1_macrocycle_209-212_1
enable tfr1_macrocycle_209-212_2
enable tfr1_macrocycle_209-212_3
enable tfr1_macrocycle_209-212_4

set grid_mode, 1
set grid_max, 5

set grid_slot, 1, tfr1_macrocycle_209-212_0
set grid_slot, 2, tfr1_macrocycle_209-212_1
set grid_slot, 3, tfr1_macrocycle_209-212_2
set grid_slot, 4, tfr1_macrocycle_209-212_3
set grid_slot, 5, tfr1_macrocycle_209-212_4

viewport 2000, 400

scene hotspot_209_212, store

# -------------------------------------------------------------------------
# OPTIONAL CONVENIENCE COMMANDS
# -------------------------------------------------------------------------

# Show only the experimental receptor anatomy:
# disable 3S9L
# disable AF3_TfR1_Tf

# Show the AF3 full-length model by itself:
# disable 6WRW
# disable 3S9L
# enable AF3_TfR1_Tf

# Show AF3 transferrin too:
# show cartoon, (AF3_TfR1_Tf and chain C+D and polymer.protein)

# Show both experimental TfR1 protomers as surfaces:
# show surface, (6WRW and chain B and polymer.protein)

# Ray trace at current viewport size:
# ray
# png tfr1_structural_context.png
