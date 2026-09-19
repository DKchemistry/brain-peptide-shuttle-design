# A Exploration of De Novo Peptide Design for Brain-Targeting Peptides Shuttles Bearing Therapeutic Cargo

By David Kouvchinov, PhD

## Motivation

I am interested in applying for a post-doctoral position regarding the de novo design of brain-targeting peptides in the context of ischemic stroke, as part of a larger interdisciplinary project. Below, I explore some of the background surrounding ischemic stroke, related therapeutic targets, promising leads/clinical efforts, and the use of peptides shuttles to target the brain. This exploration led me to consider that targeting Transferrin Receptor 1 (TfR1) with lariat macrocycles may allow for receptor-mediated transcytosis of PSD-95 inhibitor payloads across the blood brain barrier. Following, I applied the de novo peptide design platform, RFpeptides, to design potential TfR1 binding peptides that may be suitable in this context.

## Background

Stroke is a potentially fatal or otherwise debilitating medical condition in which blood flow to areas of the brain are disrupted. In 2021, it was estimated that almost 1 in 9 deaths globally were due to stroke, with many stroke survivors sustaining serious long-term disability ([Feigin et al., 2024](https://doi.org/10.1016/S1474-4422(24)00369-7)). Strokes are classified as either ischemic, due to a lack of blood flow, or hemorrhagic, due to internal bleeding. Ischemic strokes represent the most common form of stroke worldwide; nearly 65% of strokes are ischemic ([Feigin et al., 2024](https://doi.org/10.1016/S1474-4422(24)00369-7)). Reperfusion therapies (therapies meant to restore blood flow to the affected area) are a critical first-line treatment for acute ischemic stroke. They can be divided into intravenous thrombolysis (administration of a clot-dissolving medication like intravenous alteplase) or mechanical thrombectomy (physical removal of a blood clot with specialized catheters). These therapies are vital and can salvage brain tissue in appropriate contexts, but may be insufficient to attenuate further complex downstream pathology arising from ischemic injury or injury occurring from the reperfusion itself ([Weiss and Ding, 2026](https://doi.org/10.1159/000547092)). This has motivated efforts towards neuroprotective agents that could function as adjunctive therapies to ameliorate such downstream pathophysiology.


Excitotoxicity is one such downstream pathophysiological state of ischemic stroke. It is defined by the neuronal damage caused by the excess release of glutamate and subsequent activation of excitatory cell membrane receptors ([Shen et al., 2022](https://doi.org/10.1016/j.biopha.2022.113125); [Qin et al., 2022](https://doi.org/10.1038/s41392-022-01064-1); [Neves et al., 2023](https://doi.org/10.1016/j.lfs.2023.121814)). At a high level, the process towards excitotoxicity can be described as such: upon loss of blood flow in ischemic conditions, neurons lose access to glucose and oxygen, limiting their capacity to produce ATP. In this low energy state, ion pumps that depend on ATP subsequently begin to fail, disrupting the gradients of Na+/K+/Ca2+ and leading to neuron depolarization. Consequently, glutamate is released (in excess) to the extracellular space. This excess glutamate cannot be entirely cleared by various transporter proteins or other astrocyte processes and instead activates nearby transmembrane glutamate receptors of surrounding neurons, such as N-methyl-D-aspartate receptors (NMDARs). Overstimulation of NMDARs, a subset of ligand-gated ion channels that mediate Ca2+ flux, leads to excess influx of Ca2+ into the neuron and activation of calcium dependent enzymes, cumulatively promoting various cell death signals and general excitotoxic damage.


Considering the prominent role of NMDARs in ischemic excitotoxicity, early approaches towards neuroprotection focused on administration of NMDAR antagonists. Indeed, in rat models of ischemia, focal microinfusion of the NMDAR antagonist, 2-amino-7-phosphonoheptanoic acid, into relevant brain tissue was shown to be neuroprotective against the development of ischemic injury ([Simon et al., 1984](https://doi.org/10.1126/science.6093256)). However, direct antagonism of NMDARs has been associated with neurotoxicity in clinical trials. Selfotel, a small-molecule competitive NMDAR antagonist, was discontinued in phase 3 ischemic stroke trials due to a lack of efficacy and higher mortality in the treatment arm, plausibly due to neurotoxicity ([Davis et al., 2000](https://doi.org/10.1161/01.STR.31.2.347)). Considering that NMDARs mediate essential neuronal excitation in brain regions unaffected by ischemia, more targeted therapeutic strategies have been sought.

One such approach is targeting PSD-95, a scaffolding protein that couples NMDARs to intracellular signaling partners. Through its PDZ domains, PSD-95 can bind C-terminal residues of the NMDAR subunit, NR2B, and the neuronal nitric oxide synthase (nNOS) enzyme, thereby coupling NMDAR activity to the production of nitric oxide and mediating NMDAR-dependent excitotoxicity. Early work demonstrated this potential mechanism by reducing expression of PSD-95 in cultured coritcal neurons using antisense oligonucleotides ([Sattler et al., 1999](https://doi.org/10.1126/science.284.5421.1845)). This antisense-mediated knockdown reduced NMDAR-activated nitric oxidie production and excitotoxicity without inhibition of the receptor's ionic currents and calcium signaling. Later, this scaffolding was also disrupted by a 20-mer peptide, Tat-NR2B9c (also called "NA-1" or "nerinetide"), composed of the 11 residues of the cell penetrating domain of the HIV-1 Tat protein ("Tat") and the the last 9 C-terminal residues of the NR2B subunit ("NR2B9c") ([Aarts et al., 2002](https://doi.org/10.1126/science.1072873)).

It is not entirely clear which of PSD-95's PDZ domains preferentially binds NR2B-derived peptides versus nNOS, if such a preference exists at all. Though ELISA assays using biotinylated Tat-NR2B9c suggested that its relative preference is >100-fold higher for PDZ2 as opposed to PDZ1 ([Cui et al., 2007](https://doi.org/10.1523/JNEUROSCI.1464-07.2007)), fluorescence polarization competition assays with unlabeled Tat-NR2B9c instead suggested that preference was only modestly in favor of PDZ1 (Kd values: 14 μM at PDZ1, 4 μM at PDZ2, N/A at PDZ3, 10 μM at PDZ1−2) ([Bach et al., 2008](https://doi.org/10.1021/jm800836w)). Similarly, direct fluorescence polarization saturation binding assays of TAMRA-nNOS demonstrated no significant preference for PDZ1 or PDZ2, but greater affinity for PDZ1-PDZ2 constructs (Kd values: 2.4 μM at PDZ1, 1.1  μM at PDZ2, 0.15 μM at PDZ1-2) ([Bach et al., 2015](https://doi.org/10.1038/srep12157)). These findings suggest that targeting either, or perhaps both, domains to inhibit PSD-95 scaffolding of NMDAR/nNOS complexes is a plausible approach. Indeed, a high affinity dimeric bivalent inhibitor of both domains, Tat-N-dimer (Kd: 4.6 nM), was found to also confer neuroprotection in rodent models of ischemic stroke ([Bach et al., 2012](https://doi.org/10.1073/pnas.1113761109)). Clinical development of Tat-N-dimer (synonyms: Tat-NPEG4(IETDV)2, UCCB01-144, AVLX-144) is presently on-going, with Phase 1 trials completed in 2023.


Crucially, to realize the potential of disrupting the ternary complex of NMDAR/PSD-95/nNOS in clinical settings, such therapeutics must be able to effectively cross the blood brain barrier (BBB) to reach injured neurons (in addition to maintaining other ADME requirements of IV drugs). This has been observed for Tat-N-dimer and Tat-NR2B9c, partially by virtue of their efficacy in various rodent model settings as well as fluorescence imaging techniques ([Bach et al., 2012](https://doi.org/10.1073/pnas.1113761109); [Kucharz et al., 2016](https://doi.org/10.1177/0271678X16645595); [Bach et al., 2019](https://doi.org/10.1016/j.neuropharm.2019.02.035)). In the context of Tat-N-dimer and Tat-NR2B9c, the Tat peptide moiety is vital to provide BBB penetration.


Broadly, there are four routes to crossing the BBB: paracellular diffusion (passage between endothelial cells), passive diffusion (passage through the endothelial cell membrane), transport-mediated uptake (a membrane transporter physically moves its substrate across the membrane, such as GLUT1 moving glucose), and transcytosis (the cell engulfs the material into a vesicle that can pass to the abluminal, brain-facing membrane). Transcytosis can be further subdivided into two further classes depending on how the vesicle is formed: adsorptive-mediated transcytosis (AMT, nonspecific adsorption to the surface triggers vesicular uptake) and receptor-mediated transcytosis (RMT, binding to specific receptor triggers vesicular uptake) ([Prades et al., 2025](https://doi.org/10.1021/acs.molpharmaceut.4c01327)). Tat appears to leverage AMT. It is positively charged and interacts nonspecifically with negatively charged cell surfaces prior to vesicle formation. As a consequence, we may expect undesirable nonspecific peripheral tissue uptake, which has indeed been shown for fluorescent Tat-NR2B9c and Tat-N-Dimer ([Kristensen et al., 2020](https://doi.org/10.3390/pharmaceutics12070661)). This may contribute to heart failures observed in a pre-clinical study of Tat-NR2B9c in rodents ([Bach et al., 2019](https://doi.org/10.1016/j.neuropharm.2019.02.035)). Moreover, Tat-NR2B9c is considered to have poor proteolytic stability and potentially insufficient BBB permeability. Factors such as these impact the clinical viability of Tat-NR2B9c and have motivated efforts to conjugate the L- and D-isomers of brain homing peptide, BR1, to Tat-NR2B9c (e.g., D-BR1-Tat-NR2B9c, L-BR1-Tat-NR2B9c) in an effort to improve these properties ([Kolberg et al., 2026](https://doi.org/10.1016/j.ijpharm.2025.126434)). Though the D isomer improved plasma stability, binding affinity and cellular uptake were compromised. Meanwhile, the L-isomer did not ultimately yield greater levels in the brain parenchyma compared to Tat-NR2B9c. It could be envisioned that targeting the RMT mechanism through receptors with preferential CNS expression by stable peptides may provide a more durable, penetrant, and targeted therapy.


De novo design of RMT targeting proteins has previously been reported for Transferrin receptor 1 (TfR1) ([Sahtoe et al., 2021](https://doi.org/10.1073/pnas.2021569118)) and thus serves as a good model system for exploring structure-based de novo peptide design methods. However, it should be noted that while TfR1 is abundantly expressed in the brain, it is not specific to the BBB nor brain tissues ([Zhang et al., 2020](https://doi.org/10.1186/s12987-020-00209-0)). Haqqani et al. provide a useful review of known RMT targets and a perspective on the criteria of what an optimal RMT target is ([Haqqani et al., 2024](https://doi.org/10.3389/fddev.2024.1360302)).


Finally, there has been a revolution of generative protein design methods following the success of AlphaFold2, such as RFdiffusion and Bindcraft, amongst many others in this rapidly developing field (RFdiffusion: [Watson et al., 2023](https://doi.org/10.1038/s41586-023-06415-8); BindCraft: [Pacesa et al., 2025](https://doi.org/10.1038/s41586-025-09429-6)). Yang et al. provide a "state-of-affairs" review on the topic, drawing on many works from the Baker group and providing future-facing perspectives ([Yang et al., 2026](https://doi.org/10.1038/s41586-026-10328-7)). My choice in which methods I explore here are a combination of my intended peptide design approach, the method's domain applicability, the amenability of my hardware (M2 Max 32GB and an older laptop with a 1660ti 6GB) or the availability of cloud computing options, and the quality of associated documentation.

## Design Considerations, TfR1 Structural Biology, Computational Methods and Initial Results

### "To macrocycle, or not to macrocycle, that is the question."

In my view, there are a few ways to approach the design of a TfR1 peptide binder that can simultaneously bind the PDZ domains of PSD-95 and demonstrate reasonable plasma stability. One appealing approach is peptide macrocycles. Given that the project describes the involvement of peptide synthesis, I assume that the chemistry arm of the work is perfectly capable of synthesizing various macrocycles using SPPS with a macrocyclization step (or some fairly equivalent synthetic chemistry). Beyond synthetic accessibility, my preference for pursuing macrocycles stems from associations with improved drug-like properties. Macrocycles are often associated with improved binding affinity, higher plasma stability, and improved cellular penetration. Additionally, while most of the recent deep learning methods for de novo protein design seem to have primarily explored proteins or "miniproteins" of roughly 80 or more residues, RFpeptides is designed for macrocycles with experimentally validated designs in the 12–18 residue range (RFpeptides: [Rettie et al., 2025](https://doi.org/10.1038/s41589-025-01929-w)).

A risky element of using a macrocycle is that part of the pharmacophore from AVLX-144 (or NR2B9c) that binds the PDZ domains includes the C-terminal free COOH (IETDV-COOH). We may not be able to get away with X-IETDV-Y type designs in our macrocycles. One workaround for this could be a lariat macrocycle. Lariat macrocycles look like lassos, where a macrocycle ring is formed, while exposing some side chain or other synthetic handle toward derivatization to a linker (or some desired functionality). We could imagine a lariat macrocycle meant to bind TfR1 while also exposing a linker to connect to IETDV-COOH, such as the example below (Figure 1). 

![alt text](figures/lariat_macro_example.png)
*Figure 1. Example structure of a lariat macrocycle. Residues identities are color coded.* 

Lysine is not strictly required and other solvent exposed side chains are also amenable, such as the COOH for Asp/Glu or the SH of Cys. The thiol may even be preferred due to related click chemistry. Of course, a concern here is that RFpeptides may be perfectly capable of giving us binders to TfR1, but that conversion to the lariat macrocycle ultimately disrupts it. To me, this seems like a surmountable problem (certainly, this was something of a risk in the design of the AVLX-144 linkers). A linear peptide on the other hand does allow us to just maintain the IETDV-COOH motif, but retains the usual risks of peptide stability. It is a question of which risk you are more willing to take. I find the lariat approach both more prudent and exciting. The feasibility of these designs, be it peptide or macrocycle, is dependent on where at TfR1 we would like to target. Prior to getting into the methodology of RFpeptides, it is useful to first assess the general structure of TfR1 and where a binder could be designed. 

### Structural Biology of TfR1

Transferrin Receptor 1 (TfR1) is 97 kDa type a transmembrane glycoprotein expressed as a homodimer. Amongst other functions, it is one of they key proteins involved in cellular iron update via endocytosis of iron-containing transferrin. Structurally, the two identical monomers are linked by two disulfide bonds at Cys89 and Cys98. The monomers can be divided into three segments: an intracellular cytoplasmic region (res. 1-67), a single transmembrane pass (the extracellular stalk, res. 68-88), and a large soluble extracellular domain (the ectodomain, res. 89-760). The extracellular domain can be divided into several segments: the protease-like domains (res. 121-188 and 384-606), the apical domain (189-383), and the helical domain (res. 607-760). Transferrin, a key substrate of TfR1, binds along portions of the helical and protease-like domains. An annotated structure of the transferrin bound TfR1 (PDB: 39SL) is given below (Figure 2)([Eckenroth et al., 2011](https://doi.org/10.1073/pnas.1105786108)). The associated color legend is consistent throughout this writing.

![alt text](figures/3S9L_annotated.png)
*Figure 2. Transferrin-bound TfR1 complex (PDB: 3S9L), shown as the deposited biological assembly. TfR1 domains and transferrin are colored according to the legend.*

Sahoe et al., focused on targeting exposed beta strands in the apical domain as to avoid competition with transferrin binding. They pursued a "beta sheet extension" strategy, extending four consecutive strands in the aplical domain of TfR1 to larger sheets in the designed complexes. In the resolved structure of the 2DS25.5 binder complexed with ectodomain of TfR1, three consequtive consecutive strands in their complexed binder (PDB 6WRW) extend one of beta sheets in TfR1 (Figure 3). 

![alt text](figures/6wrw_beta_sheet_ext.png)
*Figure 3. Left: TfR1/2D25.5 dimeric complex (PDB: 6WRW), 2D25.5 is in teal. Right: Closer zoom of beta sheet extension between TfR1 and 2D25.5*

The apical domain/2DS25.5 interface is supported by backbone residue interactions from the most distal beta strand of TfR1 (res. 209-212) and the most proximal beta strand of the designed protein (res. 34-37), with helical domains of the binder forming additional contacts and complementary packing with helicies in the apical domain. A PSE file with protein-protein interactions detected by PLIP is available at: `tf1r-pymol/6WRW_PeptideChainC.pse` ([Schake, Bolz et al., 2025](https://doi.org/10.1093/nar/gkaf361)). Towards my goals, avoiding competition with transferrin binding is also prudent to minimize disruption of the receptor's endogenous function. However, binding along the solvent exposed apical domain beta strands with a comparably smaller peptide or macrocycle appears challenging, as it may not be possible to pick up a sufficient amount of interactions to compete with desolvation penalties. Still, I lean towards targeting this region as a first pass. Alternatively, there are a variety of shallow grooves throughout the apical and protease-like domains that could also be considered by hueristics or ranked by binding site detections tools. Cryptic pockets could potentially be ascertained by molecular dynamics.

### RFpeptides Methodology

Methodologically, RFpeptides works similar to the RFdiffusion (rfd) de novo design workflow. It is useful to start with RFdiffusion methodology and then discuss the changes RFpeptides made after. The basic rfd design process is `backbone generation` -> `sequence design` -> `oracle`. These steps are all highly modular. For example, RFdiffusion can be used to generate a variety of backbones based on conditioning parameters (e.g., binder conditioning, hot spot conditioning, motif conditioning) and auxillary potentials/steered sampling. ProteinMPNN (or another scaffold decoration model) can be used to generate sequences that fit these backbones, in either biased or unbiased manners. AlphaFold2 (or another performant structure prediction model, RF2, ESMFold, etc) can be used to validate/score the designs. It is generally advised to use a model orthogonal to the source of the diffusion model to act as the oracle for the designs, but this is not strictly required.

#### Backbone Generation

RFpeptides works almost identically to the parent RFdiffusion frameworks. A relatively small and clever change is made to allow for macrocycle backbone generation and validation/scoring without requiring retraining any of the models. AlphaFold2, RosettaFold2 and RFdiffusion all have some 2D pair representation (z) of the residues i,j in the query sequence. So the relationship of residue 1 and 2 is z_1_2, residue 1 and residue 2 is z_1_3, etc, forming a table of features like so:

```
2D pair representation z

            res. j
         1   2   3   4 
       ┌────────────────
r   1  │ z11 z12 z13 z14
e   2  │ z21 z22 z23 z24
s.  3  │ z31 z32 z33 z34
i   4  │ z41 z42 z43 z44
```

Featurized in the z_i_j terms here is, amongst other things, the relative positioning (sometimes called residue offset) of the residues, e.g., residue 4 is +3 relative to residue 1 in the table above. If we consider a peptide of length 10, then residue 10 is +9 to residue 1. In the RFpeptides workflow, they apply a "macrocycle offset" to the pair representation in RosettaFold2, RFdiffusion and AlphaFold2. After the halfway point (i.e., residue 6, +5 to residue 1), the positional encoding is instead treated as cyclic instead of a linear. So, at residue 7 we are at -4 to residue 1 instead of +6. The final residue will be -1 relative to the initial residue. Despite the immense amount of transformations that occur through the rest of these networks, this change in 2D relative positioning does indeed transfer all the way to 3D space. To demonstrate, here are five 15-mer macrocycle backbones I generated against Chain A of 6WRW, using only binder conditioning and cyclic residue positioning in RFdiffusion:

![alt text](proof-of-concept/rfd_tf1r_macrocycle/mps_5_backbones/tfr1_macrocycle_B.png)

These macrocycles were simulated at what should be the alpha helical interface between dimers of TfR1. So, fully unconstrained binder generation is likely not preferable here. However, it would be very interesting to see what unconstrained generation would look like if given the full multimeric complex: where does the model "think" a binder should go? Especially if you account for other sites a binder should avoid (e.g., transferrin, PTM residues, ion binding residues, etc). An approach like this was indeed explored in RFpeptides for some targets. Unfortunately, the computational cost, in terms of both time and memory consumption, scales agressively with residue count, and such an experiment is beyond the constraints of my current hardware. But, it is something I'd love to revisit. Instead, I conditioned on the hot spot residues corresponding to the exposed beta strand in the apical domain of TfR1 (res. 209-212, Chain A, PDB: 6WRW). This is the same site that was targeted by Sahoe et al. 

![alt text](tf1r-pymol/hotspot_209_212_2.png)

Hot spot conditioning indeed works. However, here we run into different issues. Of the five backbones I generated, all contain an alpha helical structure at the apical beta strand/binder interface. Some of these are obviously poor, with interfacial carbonyls visibly pointing directly at each other. That is not something I think sequence decoration or physics-based relaxation can entirely rescue, which would, in turn, waste compute on expensive cyclic AlphaFold2 oracle predictions. While scaling backbone generation is likely to yield better complementarity given sufficient sampling time, RFdiffusion has a known propensity towards the generation of alpha helical structures, which maybe unideal at this interface to begin with. 

Purposeful sampling of binder beta strands backbones at the interfacial site would be preferable, as it allows me to pursue a similar beta sheet extension strategy as explored by Sahoe et al. Fortunately, a method for improving this sampling has recently been developed by the Baker Lab in a process they refer to as β-pair targeting ([Sappington et al., 2026](https://doi.org/10.1038/s41467-025-67866-3)). The authors take advantage of that fact that RFdiffusion is already trained with residue secondary structures (allowing specification of the beta strand in the binder, the "SS" block) and an N by N block-adjacency matrix (describing the interactions both within and between the target and the binder, the "ADJ" block). They provide a script that calculates the associated SS/ADJ tensors blocks join that bias the model to generate the desired secondary structure in the binder at a matched adjacency in the target. This approach greatly improved both their *in silico* success rates at β-pair design and delivered experimentally validated binders across several targets.

I implemented β-pair targeting into the RFpeptides workflow. Excitingly, I do not believe this integration has been previously reported, though it is a natural extension of prior work. First, I calculated the SS/ADJ blocks for the intended binder system using the script provided by Sappington et al (see: `interface_tensors/make_interface_tensor.py`). I targeted beta strand residues (res. 209-212) in the apical domain of TfR1 (PDB 6WRW) and set a binder length of 14, with the first four residues defined as members of the beta strand.

My rationale for the choices varied and could likely be iteratively improved through experimentation. The choice of four residues as members of a beta strand was motivated by potential complementarity to the four member beta strand in the target. But, the choice of macrocycle length was essentially arbitrary, this should be tuned to a combination of the experimental demands of peptide synthesis and design considerations. The residue indicies for the beta strand in the binder are *somewhat* arbitrary, as long as they are contiguous, given the cyclical nature of the macrocycle. However, one could imagine purposefully designing a second complementary beta strand in the macrocycle to support internal beta sheet formation, which I think is an exciting future direction. This relates back to design considerations in the macrocycle length. For example, there may be some ideal length that yields designs with a complementary internal beta sheets. This may, in turn, preconfigure the design for more potent binding. Other lengths could better result in designs that yield complementary packing along nearby alpha helicies in the apical domain. These deserve experimentation. 

Following, I ran the RFpeptides backbone generation for 10 designs, with additional arguments to support β-pair targeting. Of the 10 designs generated, four of them have recognizable beta strand geometry in the binder (see 2, 4, 5, 8) with some reasonable backbone complementarity to the target. Gratifyingly, the N-C macrocycle structure was maintained throughout. Still, the designs may have issues. While I am getting some of the desired beta strand geometry/backbone interactions, most of the macrocycle residues are not interacting with the target. This is not unprecedented for "side-on" macrocycle binding, but it leaves precious few contacts to interact with.

![alt text](figures/b_pair_10_designs_labeled.png)

One possible improvement here is to select wider range of residues in the β-pairing adjacency matrix to cover more of the strand, as well as selecting additional hotspots (e.g., res. 340-345) to attempt helical interactions with the target. Presently however, diffusing just these 10 designs required nearly ~24 hours of uninterrupted compute on my M2 Max 32GB, so my ability to iterate quickly is limited. For now, I'd like to transition to my in the design process.

#### Sequence Decoration via ProteinMPNN & Rosetta Relax

In RFpeptides, sequences are decorated and the resulting macrocycle minimized by iterative rounds of ProteinMPNN and Rosetta Relax, prior to the AfCyc oracle. This differs somewhat from the more "canonical" RFdiffusion workflow, which did not find that implementing a physics-based minimization step systemically improved *in silico* success rate (percentage deemed to pass by the oracle). However, these findings appear highly empirical, as work across other benchmarks indicates the opposite. Ultimately, the rationale for Rosetta Relax in RFpeptides appears to be motivated by potentially increase sequence diversity through small, local changes in the macrocycle backbone geometry in between ProteinMPNN rounds, Later, physics-based metrics from Rosetta are also used to select candidates for synthesis. 

As described in the original report, I ran four iterative rounds of ProteinMPNN/Rosetta Relax on the apical domain macrocycles. ProteinMPNN allows selecting which residue in the macrocycles we want to constrain. I wanted to ensure an Asp/Glu/Lys/Cys was available at the most distal site relative to TfR1 for conjugation to the lariat macrocycle. I chose simple hueristic in which we select the residue that corresponds to the most distal "pseudo-CB" (+- 0.5A) that points away from the apical domain as the intended derivatization site (see: `scripts/select_distal_site.py`). A visualization of those selected residues are given below, the line and sphere correspond to the intended directionality of Asp/Glu/Lys/Cys.

![alt text](proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_visualization.png)
*Figure X. Visualization of the backbone residue for Asp/Glu/Lys/Cys sequence generation for the 10 macrocycles generated with B pairing. The lines and spheres represent the idealized geometry of Asp/Glu/Lys/Cys side chains.*

#### AfCyc Oracle

After decorating the backbones, an oracle is used to assess whether the indended design is predicted to fold as expected and whether the oracle is confident in that prediction. In RFpeptides, AfCyc and cyclic RF2 were used to refold complex. The designs were scored by it's similarity to the oracle's prediction, the model's confidence (interface predicted aligned error (iPAE)), and metrics calculated by Rosetta (calculated binding affinity (ddG), spatial aggregation propensity (SAP) of the designed macrocycle and the molecular surface area of the interface contacts (CMS)). 

I refolded the ten design with AfCyc. Unfortunately, none of the designs folded as diffused. Instead, these are all "floating binders", with the exception of one complex, none of them areaeven within 5A of a residue in the target. The iPAE values (mean 27.87 ± 0.36 Å) are uniformly poor and I did not proceed with Rosetta calculations.

![alt text](proof-of-concept/rfd_tf1r_macrocycle/afcyc_final/interface_beta4_A209-212_len14_cyclicA/afcyc_interface_beta4_A209-212_len14_cyclicA.png)
*Figure X. AfCyc refolding of all the macrocycle design.*

It is difficult to assess or interpert the computational validity of this approach due to the limited sampling performed. To my knowledge, the combination of RFpeptides and B-pair conditioning has not been benchmarked. However, indepedently, both methods exhibit substantial target dependent score distributions. It may be the case that the chosen site was particularly difficult and that substantially larger sampling campaigns could produce coherent designs. Moreover, the validation of this methodology is ultimately assessed in the lab.  

# New workflow and notes

```sh
cd /Users/lkv206/work/brain-peptide-shuttle-design
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
NEED TO VISUALIZATION, BUT THE SECTION ABOVE IS EASY TO INTERPERT. 

Now, we need to run ProteinMPNN/Rosetta Relax. 

Some important changes. 

First: Previously, I modified the XML to select the B chain, as part of that erroneous workflow. We don't need to get into that now, but we have a new XML with the correct workflow. 

Second: The issue with low temperature is not "no valid sequences", but "The failure is numerical: at very low temperature, the allowed amino acids can round to zero probability. ProteinMPNN then divides by zero when applying the restriction" via Codex. How this is meaningfully different, I am not sure. REGARDLESS, @ `--sampling_temp "0.0001"`: designs 0 and 1 succeeded; the other eight failed. So, we will move to `--sampling_temp "0.1"` as our previous wrapper was designed to do, four rounds of ProteinMPNN/Rosetta Relax with only C, D, E, or K allowed at the distal site. No manual omission files are needed, they are created from `distal_site_scores.csv`.

I run: 

```sh
cd /Users/lkv206/work/brain-peptide-shuttle-design
conda activate biopython

# Create a binder-A XML, preserving the original.
sed 's/chains="B"/chains="A"/' \
  RosettaRelax/fast_relax.xml \
  > RosettaRelax/fast_relax_binder_A.xml

design_dir=proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14

python scripts/run_mpnn_relax_all.py \
  --pdb-dir "$design_dir" \
  --scores "$design_dir/distal_site_scores.csv" \
  --output-dir proof-of-concept/rfd_tf1r_macrocycle/iterative_design/interface_beta4_A209-212_len14_cyclicA \
  --xml RosettaRelax/fast_relax_binder_A.xml
```
Briefly: IIRC, any environment here with a valid python install is fine, as `scripts/run_mpnn_relax_all.py` will activate `proteinmpnn` and `pyrosetta` as needed. When getting to the final write up, remember to include these environments. 

Output: 

```
============================================================
COMPLETE
============================================================
Round 1: EEVYGPPGMKFSGA (A10=K)
Round 2: EIVLGPPSFKDPNA (A10=K)
Round 3: EIVLGPPSFKDPSA (A10=K)
Round 4: EIVLGPPSFKDPSA (A10=K)

Final structure: proof-of-concept/rfd_tf1r_macrocycle/iterative_design/interface_beta4_A209-212_len14_cyclicA/tfr1_beta4_cyc_chain_a_9/round_4/relaxed.pdb
Summary: proof-of-concept/rfd_tf1r_macrocycle/iterative_design/interface_beta4_A209-212_len14_cyclicA/tfr1_beta4_cyc_chain_a_9/summary.tsv

All available designs completed.
```
Everything looks normal, some backbones are nonetheless flawed, see Codex report. I will visualize it. Regardless, the oracle can be run.

NEXT, ORACLE. 

```sh
cd /Users/lkv206/work/brain-peptide-shuttle-design
conda activate biopython

caffeinate -i python scripts/run_afcyc_all.py \
  --design-dir proof-of-concept/rfd_tf1r_macrocycle/iterative_design/interface_beta4_A209-212_len14_cyclicA \
  --output-dir proof-of-concept/rfd_tf1r_macrocycle/afcyc_final/interface_beta4_A209-212_len14_cyclicA \
  --params ~/alphafold \
  --target-chain B \
  --recycles 5
```
6 hrs. 

# Old workflow and notes

```sh
conda activate biopython
python scripts/select_distal_site.py \
    proof-of-concept/rfd_tf1r_macrocycle/mps \
    --peptide-chain B \
    --output proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv
```
```
tfr1_macrocycle_res_209-212_0.pdb: B7 (sequence index 7, probe clearance 12.82 Å, outward cosine 0.79, peptide clearance 4.56 Å, probe xyz = (26.421, -36.620, 0.372))
tfr1_macrocycle_res_209-212_1.pdb: B4 (sequence index 4, probe clearance 12.01 Å, outward cosine 0.18, peptide clearance 4.51 Å, probe xyz = (23.850, -38.753, 8.291))
tfr1_macrocycle_res_209-212_2.pdb: B10 (sequence index 10, probe clearance 12.18 Å, outward cosine 0.47, peptide clearance 4.51 Å, probe xyz = (22.905, -37.271, 2.154))
tfr1_macrocycle_res_209-212_3.pdb: B11 (sequence index 11, probe clearance 13.08 Å, outward cosine 0.78, peptide clearance 4.24 Å, probe xyz = (26.400, -35.911, -1.317))
tfr1_macrocycle_res_209-212_4.pdb: B7 (sequence index 7, probe clearance 12.63 Å, outward cosine 0.76, peptide clearance 4.44 Å, probe xyz = (26.023, -35.230, -2.409))
```

I visualized that "psuedo-CB" (below) as the dashed line leading to a sphere. None of the designs below display an exit vector that points into the receptor itself, though more sophisticated biasing of the directional vector can be envisioned.

![alt text](proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_visualization.png)

Now, I begun the ProteinMPNN/Rosetta Relax steps. I required the lariat attachement point to be C, D, E, or K at the position found by the previously described hueristic. Originally, I tried only K for `tfr1_macrocycle_res_209-212_0` , but this causes an error at low temperatures (i.e., `--sampling_temp "0.0001"`) as that sequence space was not valid for the trial backbone. Broadening the valid residue constraints to additionally include C, D, or E was not sufficient to allow lower temperature sampling, but a combination of the two was. My worry is that this may be deleterious to the *in silico* success rates, but this would have to be determined empirically.  

```sh

# trial dir
mkdir -p proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0

# residue selection is really by omission
cat > proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/omit_AA.jsonl <<'EOF'
{"tfr1_macrocycle_res_209-212_0": {"A": [], "B": [[[7], "ACDEFGHILMNPQRSTVWY"]]}}
EOF

conda activate proteinmpnn
# had to increase sampling_temp to get valid outputs
python ~/work/ProteinMPNN/protein_mpnn_run.py \
  --pdb_path proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_0.pdb \
  --pdb_path_chains "B" \
  --omit_AA_jsonl proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/omit_AA.jsonl \
  --out_folder proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0 \
  --num_seq_per_target 1 \
  --batch_size 1 \
  --sampling_temp "0.1" \
  --seed 1
# TSTDDAKAAADTAANGVA, Lys at 7

conda activate pyrosetta
python scripts/thread_sequence.py \
  proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_0.pdb \
  proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/threaded.pdb \
  --chain B \
  --sequence TSTDDAKAAADTAANGVA
# good in PyMol 

# make sure XML has right chain selector
python scripts/run_relax.py \
  proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/threaded.pdb \
  proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/relaxed.pdb \
  --xml RosettaRelax/fast_relax.xml

# good in PyMol 

# rename b/c omit_AA.jsonl key must match the input PDB basename
cp proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/relaxed.pdb \
   proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/round1_relaxed.pdb
mkdir -p proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/round2
cat > proof-of-concept/rfd_tf1r_macrocycle/mpnn_trial_0/round2/omit_AA.jsonl <<'EOF'
{"round1_relaxed": {"A": [], "B": [[[7], "AFGHILMNPQRSTVWY"]]}}
EOF
```

```sh
python scripts/run_mpnn_relax_one.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_0.pdb \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output proof-of-concept/rfd_tf1r_macrocycle/iterative_design/tfr1_macrocycle_res_209-212_0 \

python scripts/run_mpnn_relax_one.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_1.pdb \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output proof-of-concept/rfd_tf1r_macrocycle/iterative_design/tfr1_macrocycle_res_209-212_1 \
  --xml RosettaRelax/fast_relax.xml

python scripts/run_mpnn_relax_one.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_2.pdb \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output proof-of-concept/rfd_tf1r_macrocycle/iterative_design/tfr1_macrocycle_res_209-212_2 \
  --xml RosettaRelax/fast_relax.xml

python scripts/run_mpnn_relax_one.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_3.pdb \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output proof-of-concept/rfd_tf1r_macrocycle/iterative_design/tfr1_macrocycle_res_209-212_3 \
  --xml RosettaRelax/fast_relax.xml

python scripts/run_mpnn_relax_one.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212_4.pdb \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output proof-of-concept/rfd_tf1r_macrocycle/iterative_design/tfr1_macrocycle_res_209-212_4 \
  --xml RosettaRelax/fast_relax.xml
```

just run them in a wrapper

```sh
python scripts/run_mpnn_relax_all.py \
  --pdb-dir proof-of-concept/rfd_tf1r_macrocycle/mps \
  --scores proof-of-concept/rfd_tf1r_macrocycle/mps/distal_site_scores.csv \
  --output-dir proof-of-concept/rfd_tf1r_macrocycle/iterative_design \
  --xml RosettaRelax/fast_relax.xml
```

_0  TSSDDIKAAEDVEKTGVA
_1  LLAKQAGTSGHP
_2  TGSQEDILADPGKYP
_3  NGGATEAALAKKDGLTP
_4  DADTLRKTGDNSL

AfCyc oracle: 

```
caffeinate -i python scripts/run_afcyc_all.py \
  --design-dir proof-of-concept/rfd_tf1r_macrocycle/iterative_design \
  --output-dir proof-of-concept/rfd_tf1r_macrocycle/afcyc_final \
  --params ~/alphafold \
  --target-chain A \
  --recycles 5
```

## Methods

### PLIP Protein-Protein Interaction Profiler

The PLIP Web Server ([Schake, Bolz et al., 2025](https://doi.org/10.1093/nar/gkaf361)) was used to analyze and visualize the 2DS25.5 interactions with Tf1R (PDB 6WRW).

PyMol snippet to match color profile:

```sh

# palette
set_color domain_apical,   [0.88, 0.60, 0.68]
set_color domain_protease, [0.58, 0.72, 0.84]
set_color domain_helical,  [0.58, 0.76, 0.62]

set_color design_teal,     [0.38, 0.72, 0.72]

# element colors, softened to fit the pastel palette
set_color hetero_O, [0.85, 0.30, 0.32]
set_color hetero_N, [0.32, 0.46, 0.76]
set_color hetero_S, [0.86, 0.70, 0.24]
set_color hetero_P, [0.88, 0.48, 0.24]
set_color hetero_H, [0.62, 0.62, 0.62]


# color residues/proteins

color domain_protease, (6WRW and chain A and (resi 121-188 or resi 384-606))
color domain_apical,   (6WRW and chain A and resi 189-383)
color domain_helical,  (6WRW and chain A and resi 607-760)

color design_teal, (6WRW and chain C)


# cartoon color has to be forced b/c of PLIP presets

set cartoon_color, domain_protease, (6WRW and chain A and (resi 121-188 or resi 384-606))
set cartoon_color, domain_apical,   (6WRW and chain A and resi 189-383)
set cartoon_color, domain_helical,  (6WRW and chain A and resi 607-760)

set cartoon_color, design_teal, (6WRW and chain C)

# restore atom-type coloring for sticks

color hetero_O, (6WRW and chain A+C and elem O)
color hetero_N, (6WRW and chain A+C and elem N)
color hetero_S, (6WRW and chain A+C and elem S)
color hetero_P, (6WRW and chain A+C and elem P)
color hetero_H, (6WRW and chain A+C and elem H)

hide cartoon, 6WRW
show cartoon, (6WRW and chain A and resi 189-383)
show cartoon, (6WRW and chain C)

# match prior display conventions
set cartoon_transparency, 0.5
set cartoon_fancy_helices, 0
set antialias, 2
set ray_shadows, off
set specular, 0
set ambient, 0.45
set direct, 0.55
set reflect, 0.15
set ray_trace_mode, 1

set_view (\
     0.303326160,    0.764427364,    0.568825245,\
    -0.395983905,   -0.441835165,    0.804941535,\
     0.866678417,   -0.469374418,    0.168681860,\
    -0.004360780,   -0.002694126, -108.103218079,\
    70.625892639,  -64.891952515,   66.958488464,\
    87.552009583,  129.390075684,  -20.000000000 )

```

### Demo Run via Google Colab: RFpeptides-style RFdiffusion

Set up here: https://colab.research.google.com/drive/1z78xrKz0qno7PgzGYl1UQcVvpy09TGIo#scrollTo=oEXX8eWZCNa_

Only the protein polymer backbone (Chain A) of Tf1R is used in the RFdiffusion backbone generation. Residue hotspot is arbitrary. Range of macrocycle lengths taken from usual design lengths in RFpeptides paper.

```sh
!DGLBACKEND=pytorch python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=proof/tfr1_macrocycle \
  inference.num_designs=1 \
  'contigmap.contigs=[12-18 A121-759/0]' \
  inference.input_pdb=./tfr1_chainA.pdb \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  diffuser.T=50 \
  ppi.hotspot_res=[\'A211\']
```

Roughly ~30 minutes, 8.1 GB VRAM peak.

PDB/traj files downloaded to `./proof-of-concept/rfd_tf1r_macrocycle`

Macrocycle was `Chain B` in resulting PDB file. Visual inspection in PyMol appeared reasonable.

### Demo run via Local CPU Install: RFpeptides-style RFdiffusion

In `~/work/software`:

```sh
git clone https://github.com/RosettaCommons/RFdiffusion.git
cd RFdiffusion
```

```sh
conda create -n rfpeptides python=3.9 -y
conda activate rfpeptides
```

Trying to build for MPS in case it might work, using recommendations:

```sh
pip install \
  torch==2.3.0 \
  torchvision==0.18.0 \
  torchaudio==2.3.0 \
  "numpy<2"

pip install dgl==2.2.1 \
  -f https://data.dgl.ai/wheels/repo.html
```

Looks good.

Yao Yin Yang's MPS implementation:

```sh
pip install git+https://github.com/YaoYinYing/nvtx-mock --force-reinstall
pip install nvtx

pip install \
  git+https://github.com/YaoYinYing/SE3Transformer

pip install \
  git+https://github.com/NVIDIA/dllogger#egg=dllogger

pip install \
  hydra-core \
  pyrsistent \
  pydantic
```

The two models we need:

```sh
mkdir -p models

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/6f5902ac237024bdd0c176cb93063dc4/Base_ckpt.pt \
  -o models/Base_ckpt.pt

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/e29311f6f1bf1af907f9ef9f44b8328b/Complex_base_ckpt.pt \
  -o models/Complex_base_ckpt.pt
```

Version mismatch due to deprecation of 'torchdata.datapipes', pin to a working release:

```sh
pip install --force-reinstall --no-deps torchdata==0.7.1
```

Still errors on torchdata. DGL does not need 2.X according to RFdiffusion docker image, downgrade:

```sh
pip uninstall -y dgl torchdata
pip install dgl==1.0.1
```

Check install:

```py
import torch
import dgl
import rfdiffusion

from se3_transformer.model import SE3Transformer

print("PyTorch:", torch.__version__)
print("DGL:", dgl.__version__)
print("MPS available:", torch.backends.mps.is_available())
print("RFdiffusion import: OK")
print("SE3Transformer import: OK")
```

```sh
PyTorch: 2.3.0
DGL: 1.0.1
MPS available: True
RFdiffusion import: OK
SE3Transformer import: OK
```

Now, test a 15-mer on Chain A of Tf1R PDB: 6RWR:

```sh
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

Finished design in 114.18 minutes. Looks fine in PyMol.

### Demo run via Local (Partial) MPS Install: RFpeptides-style RFdiffusion

Unfortunately, Yao Yin Yang's MPS port was written prior to RFpeptides macrocyclic offset.

Porting in either direction (add MPS to RFpeptides or macrocyclic offset Yang's MPS port) is tough without a lot of dedicated effort.

I tried using ChatGPT Codex (GPT-6 Astra) to add limited MPS support to RFpeptides, as that seemed easier to validate. Worst case scenario is the speed up is poor, but the relative positioning stays untouched. **Nevertheless, this is experimental at best, caveat emptor.**

```sh
cd ~/work/rfdiffusion-rfpeptides-mps

conda activate rfpep-mps

export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0
```

```py
import torch
import rfdiffusion

print("PyTorch:", torch.__version__)
print("MPS built:", torch.backends.mps.is_built())
print("MPS available:", torch.backends.mps.is_available())
print("RFdiffusion:", rfdiffusion.__file__)
```

```sh
PyTorch: 2.3.0
MPS built: True
MPS available: True
RFdiffusion: /Users/lkv206/work/rfdiffusion-rfpeptides-mps/rfdiffusion/__init__.py
```

```sh
cd ~/work/rfdiffusion-rfpeptides-mps

conda activate rfpep-mps

python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps_port_test/tfr1_macrocycle \
  inference.num_designs=1 \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  'contigmap.contigs=[15-15 A121-759/0]' \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  inference.device=mps \
  diffuser.T=50
```

It is faster, but not by much: 95.61 minutes total, an 18 minute improvement.

### Hot spot screens

##### Hot Spots: Residues 209-212, Input PDB: Chain A of 6WRW

Residues 209-212 is the exposed apical beta strand. I generated 5 designs like so:

```sh
cd ~/work/rfdiffusion-rfpeptides-mps

conda activate rfpep-mps

export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0

python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps/tfr1_macrocycle_res_209-212 \
  inference.num_designs=5 \
  'contigmap.contigs=[12-18 A121-759/0]' \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  diffuser.T=50 \
  'ppi.hotspot_res=[A209,A210,A211,A212]'
```

Hot spot targeting worked great, but the backbones were subpar. I think we need to try to enforce a beta sheet design if we can. Use the pyrosetta/torch install below to run the adjacency tensor script from the Baker Lab to set up for targeted beta strand generation. Then, go to the next step section. 

### Hot spot & beta strand adjacency matrix screens

Calculate adj. matrix for Chain A 6WRW and a macrocycle of length 14. Require 4 of the residues in the macrocycle be in a beta strand (as was the Baker binder in 6WRW).

The script effectively has an off by 1 error. For TfR1 A121–759, requesting A210-213 produces adjacency on actual target residues A209-212. 

```sh
cd /Users/lkv206/work/brain-peptide-shuttle-design
conda activate pyrosetta

mkdir -p proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors

python interface_tensors/make_interface_tensor.py \
  --input_pdb proof-of-concept/tf1r/6wrw_ChainA.pdb \
  --out_dir proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors \
  --binderlen 14 \
  --target_adj A210-213 \
  --binder_ss E \
  --binder_ss_len 4
```
So one maddening note here, the `cyc_chains` are only internal to RFpeptides and have nothing to do with the PDB Chain field. Before I was using `a` to note the macrocycle chain. The convention seems to be the opposite, `b` for binder I guess! So, I've swtiched to `b`. It shouldn't change anything important. Obviously, don't propogate the tensor off by 1 error here.  

```sh
cd ~/work/rfdiffusion-rfpeptides-mps
conda activate rfpep-mps

export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0

mkdir -p /Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14

python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps/interface_beta4_A209-212_len14/tfr1_beta4 \
  inference.num_designs=10 \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  'contigmap.contigs=[A121-759/0 14]' \
  scaffoldguided.scaffoldguided=True \
  scaffoldguided.scaffold_dir=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors \
  scaffoldguided.scaffold_list=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/interface_beta4_A209-212_len14/tensors.txt \
  inference.cyclic=True \
  inference.cyc_chains='b' \
  diffuser.T=50 \
  'ppi.hotspot_res=[A209,A210,A211,A212]'
```

These designs had some excellent beta strand complementarity, but the macrocycles structures were lost.

### Hot spot & beta strand adjacency matrix screens Corrected

I think I switched a and b incorrectly last time in the cyc chains, trying again:

```sh
cd ~/work/rfdiffusion-rfpeptides-mps
git switch codex/mps-port
conda activate rfpep-mps

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

### Rosetta Foundary Install

RosettaCommons Foundry has an Apple MPS fork that can be installed:

```sh
conda create -n foundry-mac python=3.12 -y
conda activate foundry-mac

pip install torch
pip install "rc-foundry[all] @ git+https://github.com/fnachon/foundry.git"

foundry install base-models
```

This gives us access to several models, including ProteinMPNN.

### Demo run via Local Compute: ProteinMPNN

From root:

```sh
conda activate foundry-mac
mpnn \
  --model_type protein_mpnn \
  --structure_path proof-of-concept/rfd_tf1r_macrocycle/tfr1_macrocycle_0.pdb \
  --checkpoint_path ~/.foundry/checkpoints/proteinmpnn_v_48_020.pt \
  --is_legacy_weights True \
  --out_directory proof-of-concept/rfd_tf1r_macrocycle/mpnn \
  --designed_chains '["B"]' \
  --batch_size 8 \
  --number_of_batches 1 \
  --temperature 0.1
```

The sequence of b0_d0 is: `ETGTPTSPLLGVLGA`. Output CIF files appear reasonable in PyMol.

This is extremely fast.

### Demo run via Local Compute: AfCyc

This can be installed via the ColabDesign Github:

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

Run against b0_d0 design with ProteinMPNN sequence `ETGTPTSPLLGVLGA` with 1 recycle (two forward passes).

```sh
conda activate afcyc

python scripts/afcyc_predict.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/tfr1_macrocycle_0.pdb \
  --target_chain A \
  --sequence ETGTPTSPLLGVLGA \
  --params ~/alphafold \
  --out proof-of-concept/rfd_tf1r_macrocycle/afcyc/b0_d0 \
  --recycles 1
```

Roughly ~13.5 minutes for 1 recycle (two forward passes).

We may get some minor speed up from cacheing the JAX compilation graph.

Run against the same design with the standard 5 passes.

```sh
export JAX_COMPILATION_CACHE_DIR="$HOME/.cache/jax"

conda activate afcyc

python scripts/afcyc_predict.py \
  --pdb proof-of-concept/rfd_tf1r_macrocycle/tfr1_macrocycle_0.pdb \
  --target_chain A \
  --sequence ETGTPTSPLLGVLGA \
  --params ~/alphafold \
  --out proof-of-concept/rfd_tf1r_macrocycle/afcyc/b0_d0_r5 \
  --recycles 5
```

Here, I get ~40 min.

So, to make 1 macrocycle backbone against Chain A of TfR1, it will take 2.5-3 hours.

### PyRosetta Install

```sh
conda create -n rosetta \
  -c https://conda.rosettacommons.org \
  -c conda-forge \
  rosetta
```

We all need to install torch here to use the beta strand tensor generation script.

```sh  
conda activate pyrosetta
python -m pip install torch
```

That broke it.

```sh
conda activate pyrosetta

python -m pip uninstall -y torch

conda install -y -c conda-forge pytorch

python - <<'PY'
import torch
import pyrosetta

print("torch:", torch.__version__)
print("pyrosetta: OK")
PY
```

Now it works. 

### Production Run via Local (Partial) MPS Install: 5 RFpeptides-style RFdiffusions, no hot spot

I was curious what sites would be targeted by a handful of designs without hot spot set up. I chose a 15-mer arbitrarily at this stage.

```sh
cd ~/work/rfdiffusion-rfpeptides-mps
conda activate rfpep-mps

mkdir -p /Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps_5_backbones

export DGLBACKEND=pytorch
export PYTORCH_ENABLE_MPS_FALLBACK=0

python scripts/run_inference.py \
  --config-name base \
  inference.output_prefix=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/rfd_tf1r_macrocycle/mps_5_backbones/tfr1_macrocycle \
  inference.num_designs=5 \
  inference.input_pdb=/Users/lkv206/work/brain-peptide-shuttle-design/proof-of-concept/tf1r/6wrw_ChainA.pdb \
  'contigmap.contigs=[15-15 A121-759/0]' \
  inference.cyclic=True \
  inference.cyc_chains='a' \
  inference.device=mps \
  diffuser.T=50
```

This approach is unlikely to work. All the design were put at the alpha helical homodimer interaction motif. The prior is too strong here. You need to force it with hot spots. 

### Distal Residue Selection script

Env creation: 

```sh
conda create -n biopython python=3.12 biopython numpy scipy -c conda-forge
```



draft text i don't want to delete yet

"but due to mitigating factors such as time-sensitivity of treatment and the inability to necessarily obviate all downstream pathology from initial nueronal injury."

"Similar, albeit nuanced, findings were reported for clinical trials of Selfotel in the treatment of severe head injury. Though mortality rates here did not reveal any statistical significant differences between control and treatment arms after discontinuing the trials due to such concerns, futility analyses suggested that a beneficial outcome was extremely unlikey. "

"Fluorescently labeled Tat-N-dimer has additionally been observed to cross the BBB and accumulate in nerve cells by in vivo two-photon microscopy (Kucharz et al., 2016, doi: 10.1177/0271678X16645595)."

PyMol:

```sh
pymol *.pdb
split_chains tfr1_macrocycle_0
split_chains tfr1_macrocycle_1
split_chains tfr1_macrocycle_2
split_chains tfr1_macrocycle_3
split_chains tfr1_macrocycle_4

# Baker style coloring: 

bg_color white

set ray_shadows, off
set specular, 0
set ambient, 0.45
set direct, 0.55

hide everything
show cartoon

set ray_trace_mode, 1

# Shared A-chain gray
set_color design_gray, [0.72, 0.73, 0.72]

# B-chain palette
set_color design_blue,     [0.43, 0.62, 0.78]
set_color design_salmon,   [0.88, 0.55, 0.50]
set_color design_sage,     [0.55, 0.72, 0.57]
set_color design_lavender, [0.68, 0.59, 0.78]
set_color design_gold,     [0.88, 0.72, 0.40]

# A chains
color design_gray, tfr1_macrocycle_*_A

# B chains
color design_blue,     tfr1_macrocycle_0_B
color design_salmon,   tfr1_macrocycle_1_B
color design_sage,     tfr1_macrocycle_2_B
color design_lavender, tfr1_macrocycle_3_B
color design_gold,     tfr1_macrocycle_4_B

show sticks, tfr1_macrocycle_*_B
hide cartoon, tfr1_macrocycle_*_B

set_color hetero_O, [0.85, 0.28, 0.30]
set_color hetero_N, [0.30, 0.45, 0.78]
set_color hetero_S, [0.88, 0.72, 0.25]
set_color hetero_P, [0.90, 0.50, 0.25]

color hetero_O, (tfr1_macrocycle_*_B and elem O)
color hetero_N, (tfr1_macrocycle_*_B and elem N)
color hetero_S, (tfr1_macrocycle_*_B and elem S)
color hetero_P, (tfr1_macrocycle_*_B and elem P)

set grid_mode, 1
set grid_max, 5

set grid_slot, 1, tfr1_macrocycle_0_B
set grid_slot, 2, tfr1_macrocycle_1_B
set grid_slot, 3, tfr1_macrocycle_2_B
set grid_slot, 4, tfr1_macrocycle_3_B
set grid_slot, 5, tfr1_macrocycle_4_B

reset

# this is gonna make it very hard to see 
# you have to set up the scene around this 
viewport 2000, 400
set_view (\
     0.488292694,   -0.848794222,   -0.202775910,\
     0.668964982,    0.513277769,   -0.537617445,\
     0.560406804,    0.126864672,    0.818443000,\
     0.000000000,    0.000000000,  -60.247116089,\
    11.044399261,   26.886058807,  -20.540231705,\
    47.713481903,   72.780784607,  -20.000000000 )

# ray
# png 
```

Resource wise, there isn't a complete build of RFpeptides for Apple MPS (RFD3 seems to, but it handles macrocycles differently), but I did get it working on Google Colab (see [here](https://colab.research.google.com/drive/1z78xrKz0qno7PgzGYl1UQcVvpy09TGIo#scrollTo=kflXqJFLCNV8)). It is pretty slow, about 30 minutes/8GB VRAM per run on a free tier T4 for a 12-18-mer with chain A (639 residues) of TfR1 from PDB 6WRW, but this could potentially be sped up by cropping the receptor to relevant domains. On my M2 Max 32GB, this takes 115 min on CPU, and 95 min with a partial build against Apple's MPS. This approach is nonetheless very computationally demanding without access to 5090/A100 class GPUs. GPU availability in Colab is also very limited/transient and is in no way "on-demand compute". Later use of AfCyc as an oracle is also expensive and not supported on MPS (~40 min). The VRAM demands are more than my limited 1660ti can manage. Regardless, as a pedagogical exercise, this throughput may be sufficient.

to generate backbones to a target, then using ProteinMPNN to decorate the backbone with sequences, and then use AlphaFold2 as an oracle to validate/score the prediction.This workflow is very modular. The backbone diffusion process can be conditioned on additional data or steered with various potentials. ProteinMPNN can be substituted with other sequence design tools (e.g., SolubleMPNN or LigandMPNN) depending on workflow/project needs. Alphafold2 can also be substituted with another performant structure prediction methods (RosettaFold, ESMFold, etc) that can validate the designs. It is sometimes advised to use an orthogonal oracle (i.e., using AF2 to evaluate RFD designs), because rfd is ultimately initalized from RosettaFold weights and may have some subtle self-bias, though the RFpeptides workflow at times used both RosettaFold2 and AlphaFold2 in a consensus oracle approach.

# Fold Conditioning Install Attempt

I'd like to have this functionality: https://www.nature.com/articles/s41467-025-67866-3?utm_source

Essentially, fold conditioning for beta strands. RFpeptides doesn't have this.

First, we need the other model.

```
cd ~/work/rfdiffusion-rfpeptides-mps/models

curl -L \
  http://files.ipd.uw.edu/pub/RFdiffusion/60f09a193fb5e5ccdc4980417708dbab/Complex_Fold_base_ckpt.pt \
  -o Complex_Fold_base_ckpt.pt