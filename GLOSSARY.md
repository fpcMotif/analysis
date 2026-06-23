# Tao-Analysis-in-Lean Glossary

Canonical Lean terminology for this workspace, grounded in the mathematics. A term is added
here once you can use it correctly — the glossary grows as you do, and every lesson uses
these words consistently.

## Terms

**Tactic**:
An instruction that transforms the current proof goal — the Lean analogue of one step in a
prose proof ("by induction…", "rewriting…", "it suffices to show…").
_Avoid_: command, function, method

**Goal**:
The statement Lean currently needs you to prove, displayed together with its available
hypotheses.
_Avoid_: target, objective

**Tactic state**:
What Lean shows at the cursor: the hypotheses you have (above the `⊢` turnstile) and the
goal you must close (below it). Reading it fluently *is* the core skill.
_Avoid_: context, proof state

**`sorry`**:
A placeholder telling Lean "assume this goal is proved." Every unfinished exercise in the
companion is a `sorry` waiting to be replaced by a real proof.
_Avoid_: stub, TODO, hole

## Induction

**Base case**:
The first goal induction hands you: a proof that the statement holds at `0` (Tao's `P(0)`). In
the companion idiom it is the `.`-bulleted block after `apply induction`.
_Avoid_: first step, initial condition

**Successor step** (inductive step):
The second goal: assuming the statement for an arbitrary `n` (the induction hypothesis), prove
it for `n++`. Opened by `intro n ih` in the companion, or the `| succ k ih =>` branch in
mainstream syntax.
_Avoid_: recursive case, next case

**Induction hypothesis**:
The proof, available inside the successor step, that the statement already holds for the
predecessor — conventionally named `ih`. It is what makes induction stronger than plain case
analysis.
_Avoid_: the assumption, the IH variable

**Recursor**:
The primitive eliminator (`Nat.rec`) that the `induction` tactic compiles down to; its
arguments are exactly the base-case proof and the successor function. Tao's Axiom 2.5 is its
mathematical content.
_Avoid_: equating it with the `induction` tactic itself

**Generalizing** (reverting before induction):
Moving dependent variables back into the goal before inducting so the induction hypothesis
comes out universally quantified and strong enough to use — done with `revert`, or
`induction n generalizing m`.
_Avoid_: clearing, forgetting the variable

## Conventions

**Recursed argument** (the "easy side" rule):
Addition is defined by recursion on one argument; equalities that fix the *recursed* argument
hold by `rfl`, while the other side needs induction. The companion (per Tao) recurses on the
**first** argument (so `0+m=m` is free, `n+0=n` is inductive); NNG / Mathlib recurse on the
**second** (the mirror image).
_Note_: same two facts, opposite difficulty — memorise "the recursed argument is the easy side."
