# Mission: Formalizing Tao's *Analysis* in Lean 4

## Why
You already understand real analysis at the level of Tao's *Analysis I & II* — you can
write the proofs on paper. The goal is to make a machine check them: to gain the deep,
durable mastery that comes from formalizing what you already know in Lean 4, turning
intuitive rigor into machine-verified rigor. This is self-study for its own sake — no
deadline, no exam.

## Success looks like
- You can take a proof you understand on paper and translate it into a working Lean proof.
- You can read Lean proofs in the `teorth/analysis` companion and in Mathlib and follow
  what each tactic is doing.
- You can independently replace `sorry`s in the early sections of the companion, starting
  with Chapter 2 (the Peano naturals).
- You are comfortable navigating the Lean *tactic state* — reading a goal and choosing a
  tactic that moves it forward.

## Constraints
- Self-paced, no deadline. Lessons must be short and self-contained.
- Starting point: mathematically mature, new to Lean / proof assistants.
- Windows machine; working directory is the `teorth/analysis` checkout.

## Out of scope (for now)
- Learning new *analysis* content — you have the math; we are learning the medium.
- Lean as a general programming language (functional programming, metaprogramming) beyond
  what proofs require.
- Deep dependent-type-theory foundations — only as much as proofs actually need.
