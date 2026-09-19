# Environments 

The following environments are required to reproduce the reported workflows. Unless otherwise noted, all environments were built and all code was executed on an M2 Max 32 GB.

## RFpeptides (RFdiffusion with cyclic offsets) (CPU)

Initially, the CPU version of RFdiffusion was used.

```sh
git clone https://github.com/RosettaCommons/RFdiffusion.git
cd RFdiffusion

conda create -n rfpeptides python=3.9 -y
conda activate rfpeptides

pip install \
  torch==2.3.0 \
  "numpy<2" \
  dgl==1.0.1 \
  hydra-core \
  pyrsistent

pip install git+https://github.com/NVIDIA/dllogger#egg=dllogger

pip install ./env/SE3Transformer
pip install -e .
```

Download the model checkpoints required for monomer and binder design:

```sh
mkdir -p models

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/6f5902ac237024bdd0c176cb93063dc4/Base_ckpt.pt \
  -o models/Base_ckpt.pt

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/e29311f6f1bf1af907f9ef9f44b8328b/Complex_base_ckpt.pt \
  -o models/Complex_base_ckpt.pt
```


## RFpeptides (RFdiffusion with cyclic offsets) (Partial MPS)

Limited Apple MPS support was added to RFdiffusion by ChatGPT Codex (GPT-6 Astra). The branch corresponding to the MPS implementation, `codex/mps-port`, can be found on my GitHub (https://github.com/DKchemistry/rfdiffusion-rfpeptides-mps/tree/codex/mps-port). The implementation proceeded from checkout of the official RosettaCommons repository, pinned to commit `86507b6538f51fce57b5a72477165f03999ed7ae`. Primarily, the implementation pursued a conservative hybrid MPS/CPU strategy. To the extent possible, the neural network ran on Apple’s GPU through PyTorch MPS, while retaining the original SE3Transformer, DGL graph construction, and selected geometric distance calculations on CPU. The implementation migrated from PyTorch 1.9 to 2.3 for improved MPS support. Consequently, a minor change was implemented to account for the change from truncation to floor division in `torch.floor_divide()` during calculations of residue offsets. Other changes were minor, such as making CUDA-specific profiling instrumentation optional.

In the limited testing performed, the required tensor transfers between devices likely contribute to slower execution (relative to CPU only) in systems with a small amount of residues. At residue sizes used for TfR1 peptides designs (641 residues in target, 14-18-mer peptide binders), a speed up of ~18 minutes was observed (~96 min on MPS, 114 min on CPU). 

To install the environment:

```sh
git clone --branch codex/mps-port \
  https://github.com/DKchemistry/rfdiffusion-rfpeptides-mps.git
cd rfdiffusion-rfpeptides-mps

# In case of updates, use this check out.
git checkout f457c3dbf0797b372692d1e0b3f6ba4dfeaa0e12

conda create -n rfpep-mps -c conda-forge python=3.10 pip
conda activate rfpep-mps

pip install torch==2.3.0 -r port_validation/requirements-inference.txt
pip install --no-deps -e env/SE3Transformer -e .

export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0

# Download the monomer, binder, and fold conditioning checkpoints
mkdir -p models

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/6f5902ac237024bdd0c176cb93063dc4/Base_ckpt.pt \
  -o models/Base_ckpt.pt

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/e29311f6f1bf1af907f9ef9f44b8328b/Complex_base_ckpt.pt \
  -o models/Complex_base_ckpt.pt

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/60f09a193fb5e5ccdc4980417708dbab/Complex_Fold_base_ckpt.pt \
  -o Complex_Fold_base_ckpt.pt

# Configure runtime backends
export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0
```

To activate and use: 

```sh
cd ~/path/to/rfdiffusion-rfpeptides-mps
conda activate rfpep-mps
export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0
```

## ProteinMPNN 

Installed as described by official repo: https://github.com/dauparas/ProteinMPNN


## PyRosetta 

PyRosetta was installed as such: 

```sh
conda create -n pyrosetta \
  -c https://conda.rosettacommons.org \
  -c conda-forge \
  python=3.12 pyrosetta
```

Torch (or rather, pytorch) must be installed to use the beta-pairing script. See below. 

```sh  
conda activate pyrosetta
python -m pip install torch
```

That broke it.

```sh
conda activate pyrosetta

python -m pip uninstall -y torch

conda install -y -c conda-forge pytorch
```

Now it works. 

## Biopython (for Distal Residue Selection)

```sh
conda create -n biopython python=3.12 biopython numpy scipy -c conda-forge
```

## AfCyc

AfCyc can be installed via the ColabDesign Github:

```sh
conda create -n afcyc python=3.11 -y
conda activate afcyc

pip install git+https://github.com/sokrypton/ColabDesign.git
```

Alphafold2 weights can be downloaded like so:

```sh
mkdir -p ~/alphafold/params
curl -fsSL https://storage.googleapis.com/alphafold/alphafold_params_2022-12-06.tar \
  | tar x -C ~/alphafold/params
```
# Scripts

## 15-mer macrocycle backbones generated against Chain A of 6WRW, using only binder conditioning.

Paths should be replaced where necessary. 

```sh
conda activate rfpeptides
cd ~/path/to/RFdiffusion

python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/local_rfd/tfr1_macrocycle \
  inference.num_designs=1 \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  'contigmap.contigs=[15-15 A121-759/0]' \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  diffuser.T=50
```
## Beta Pair SS/ADJ calculations. 

Download and unzip `interface_tensors` from: https://www.nature.com/articles/s41467-025-67866-3. Move to root. 

```sh
# from root
conda activate pyrosetta

# tensor dir
mkdir -p proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors

# suspected an off by 1 error due to pdb renumbering,
# so, --target_adj was A210-213 instead of A209-212
# needs to be revisited
python interface_tensors/make_interface_tensor.py \
  --input_pdb proof-of-concept/tf1r/6wrw_ChainA.pdb \
  --out_dir proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors \
  --binderlen 14 \
  --target_adj A210-213 \
  --binder_ss E \
  --binder_ss_len 4
```
## RFdiffusion of 14-mer cyclic peptides with Beta Pairing

```sh
# fork of rfpeptides with experimental support for apple mps
# use native if available
cd ~/work/rfdiffusion-rfpeptides-mps
git switch codex/mps-port
conda activate rfpep-mps

# settings for experimental mps fork
export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0

python scripts/run_inference.py \
  --config-name base \
  inference.device=mps \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14/tfr1_beta4_cyc_chain_a \
  inference.num_designs=10 \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  'contigmap.contigs=[A121-759/0 14]' \
  scaffoldguided.scaffoldguided=True \
  scaffoldguided.scaffold_dir=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors \
  scaffoldguided.scaffold_list=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors.txt \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  diffuser.T=50 \
  'ppi.hotspot_res=[A209,A210,A211,A212]'
```

## Distal Site Detection

This script assumes that the directory contains a set of `*.pdb` files. For example, `proof-of-concept/rfd_tf1r_macrocycle/mps` in my repo is: `proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_*.pdb`.

```sh
conda activate biopython
python scripts/select_distal_site.py \
    proof-of-concept/rfd_tf1r_macrocycle/mps \
    --peptide-chain B \
    --output proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv
```

This command was run for the 10 designs w/ B-pairing. 

```sh
conda activate biopython

design_dir=proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14

mkdir -p "$design_dir/previous_cyc_chain_b"

# more previous designs out
mv "$design_dir"/tfr1_beta4_[0-9].pdb \
   "$design_dir"/tfr1_beta4_[0-9].trb \
   "$design_dir/previous_cyc_chain_b/"

python scripts/select_distal_site.py \
  "$design_dir" \
  --peptide-chain A \
  --output "$design_dir/distal_site_scores.csv"
```

Output: 

```
tfr1_beta4_cyc_chain_a_0.pdb: A4 (sequence index 4, probe clearance 11.59 Å, outward cosine -0.08, peptide clearance 5.38 Å, probe xyz = (24.471, -38.449, 8.242))
tfr1_beta4_cyc_chain_a_1.pdb: A1 (sequence index 1, probe clearance 13.38 Å, outward cosine 0.78, peptide clearance 7.19 Å, probe xyz = (34.671, -42.464, 5.245))
tfr1_beta4_cyc_chain_a_2.pdb: A1 (sequence index 1, probe clearance 11.62 Å, outward cosine 0.93, peptide clearance 6.92 Å, probe xyz = (24.433, -38.299, 7.376))
tfr1_beta4_cyc_chain_a_3.pdb: A8 (sequence index 8, probe clearance 14.54 Å, outward cosine 0.99, peptide clearance 8.25 Å, probe xyz = (43.018, -40.337, 1.984))
tfr1_beta4_cyc_chain_a_4.pdb: A8 (sequence index 8, probe clearance 14.33 Å, outward cosine 0.99, peptide clearance 6.87 Å, probe xyz = (40.331, -40.231, -0.104))
tfr1_beta4_cyc_chain_a_5.pdb: A10 (sequence index 10, probe clearance 14.10 Å, outward cosine 0.74, peptide clearance 6.23 Å, probe xyz = (25.727, -40.716, 4.782))
tfr1_beta4_cyc_chain_a_6.pdb: A11 (sequence index 11, probe clearance 12.13 Å, outward cosine 0.60, peptide clearance 4.98 Å, probe xyz = (27.352, -36.353, 0.539))
tfr1_beta4_cyc_chain_a_7.pdb: A1 (sequence index 1, probe clearance 13.75 Å, outward cosine 0.41, peptide clearance 7.03 Å, probe xyz = (43.133, -40.525, 10.010))
tfr1_beta4_cyc_chain_a_8.pdb: A3 (sequence index 3, probe clearance 13.76 Å, outward cosine 0.95, peptide clearance 6.61 Å, probe xyz = (26.711, -37.961, 0.443))
tfr1_beta4_cyc_chain_a_9.pdb: A10 (sequence index 10, probe clearance 13.25 Å, outward cosine 0.93, peptide clearance 5.67 Å, probe xyz = (25.372, -39.221, 3.797))
```

## Iterative ProteinMPNN and RosettaRelax

Note: The XML preconfigures the identity of your chains. The binder should be relaxing. The XMLs in my repo are switched due to various experiments. 

If A is your binder: `RosettaRelax/fast_relax_binder_A.xml`

If B is your binder: `RosettaRelax/fast_relax.xml`


```sh
# the script is just a wrapper and will
# activate proteinmpnn/pyrosetta
conda activate biopython

design_dir=proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14

python scripts/run_mpnn_relax_all.py \
  --pdb-dir "$design_dir" \
  --scores "$design_dir/distal_site_scores.csv" \
  --output-dir proof-of-concept/rfd_tf1r_macrocycle/iterative_design/interface_beta4_A209-212_len14_cyclicA \
  --xml RosettaRelax/fast_relax_binder_A.xml
```

