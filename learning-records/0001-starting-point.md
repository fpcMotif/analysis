# Starting point: math-mature, Lean-new, formalizing for mastery

The learner is comfortable reading and writing analysis proofs at the level of Tao's
*Analysis I & II*. They are new to Lean and proof assistants. The mission is self-study
mastery via formalizing analysis they already understand. See [[MISSION.md]].

**Evidence:** A near-complete worked LaTeX solution set to both volumes is present in the
workspace (`taoanalysissolutions-master/`), with only a handful of exercises left open.

**Implications for what to teach next:**
- Do not teach analysis content — it would set the floor far too low.
- Teach the Lean medium: the tactic state, tactics, and above all *translation* of a known
  paper proof into a tactic proof.
- Begin with the Peano naturals (Tao Ch 2 ≈ companion `Section_2_1`), routed through the
  Natural Number Game, because the maths is trivial for this learner and frees all working
  memory for Lean itself.
