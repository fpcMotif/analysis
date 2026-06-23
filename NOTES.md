# Teaching Notes

## About the learner
- Mathematically mature. A near-complete worked LaTeX solution set to Tao *Analysis I & II*
  is available (`taoanalysissolutions-master/`, fetched via `scripts/fetch-sources.sh`) —
  treat the maths as known.
- New to Lean / proof assistants.
- Goal is mastery for its own sake; no deadline.

## Preferences
- (none stated yet — record them here as they emerge)

## Working decisions
- Do **not** teach analysis content; teach the Lean medium, grounded in maths already known.
- Use the Peano naturals (Tao Ch 2 ≈ companion `Section_2_1`) as the on-ramp — it maps
  perfectly onto the Natural Number Game, so all working memory goes to Lean, not maths.
- Keep lessons short. Prefer the tightest possible feedback loop (NNG's instant checker,
  in-browser self-check quizzes).
- The recurring growth edge is *translation*: a paper proof → a tactic proof.
- Keep the glossary's Lean terms consistent across every lesson.

## Domain facts to teach accurately (verified against source)
- **The recursion-direction flip.** The companion (faithful to Tao Def 2.2.1) defines `+` by
  recursion on the **first** argument (`Nat.add n m := recurse (·++∘snd) m n`,
  `Section_2_2.lean:38`), so `zero_add : 0+m=m` is **rfl** and `add_zero : n+0=n` needs
  **induction**. The Natural Number Game and Lean-core/Mathlib `Nat` recurse on the **second**
  argument, so it's the mirror image (`add_zero` free, `zero_add` inductive). Always keep the
  two conventions separate in lessons. Mnemonic: *the recursed argument is the easy side.*
- **Notation differs by codebase.** Companion successor is `n++` (`postfix "++"`). NNG and
  mainstream Lean write `succ n` / `n + 1`. Never write `d++` in an NNG context.
- **Induction idioms differ.** Companion house style is `revert n; apply induction` (its own
  `Nat.induction` theorem, `Section_2_1.lean:118`) → `.`-bulleted base → unbulleted `intro n ih`.
  Mainstream is `induction n with | zero => … | succ k ih => …`. Teach both; flag which is which.
- **Live induction `sorry`s in `Section_2_2.lean`:** `add_assoc` (Exercise 2.2.1, L100),
  `add_ge_add_right`, `zero_le`, and the three custom induction principles. `succ_eq_add_one`
  (L86) is a `sorry` too but is pure `rw`, not induction — good warm-up.

## Side-projects
- `side-projects/reals-from-rationals.html` — standalone illustrated page constructing ℝ from ℚ:
  Cauchy sequences (primary; faithful Chapter5 Lean + idiomatic Mathlib notes) and Dedekind cuts
  (illustrative Lean, NOT in Mathlib/companion), with KaTeX math, syntax-highlighted Lean, SVG cut
  visuals, a comparison table, and the √2 example in both constructions. Math/Lean were
  source-verified against `Section_5_1..3.lean` and adversarially checked. Self-contained (KaTeX via
  CDN; degrades to raw-LaTeX fallback offline). Built 2026-06-22.

## Environment / setup TODO
- **New device?** Run `bash scripts/setup-local.sh` once: fetches the external reference
  texts (git-ignored, see RESOURCES.md) and installs a hook to keep them fresh.
- Lean is **not yet confirmed installed** locally. NNG needs nothing but a browser.
- When we move from NNG to the companion, we'll need `elan` + `lake` + VS Code with the
  Lean 4 extension. Surface this then; don't front-load install friction.
