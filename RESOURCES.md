# Tao's *Analysis* in Lean — Resources

Knowledge is drawn from these sources, not from guesswork. Wisdom comes from the community.

## Knowledge

- [Natural Number Game (NNG4)](https://adam.math.hhu.de/#/g/leanprover-community/NNG4) — [repo](https://github.com/leanprover-community/NNG4)
  Browser-based, zero-install, instant feedback. Builds ℕ from the Peano axioms — i.e.
  Tao Chapter 2. Use for: your very first hands-on Lean and the `rfl` / `rw` / `induction`
  tactics. This is the on-ramp.
- [The Mechanics of Proof — Heather Macbeth](https://hrmacbeth.github.io/math2001/) — [repo](https://github.com/hrmacbeth/math2001)
  A "bilingual" intro: every proof written both in prose and in Lean. Ideal because you
  already know the math. Caveat: uses a deliberately *weakened teaching dialect* of Lean,
  so some tactics differ from mainstream Mathlib. Use for: proof technique, calculation,
  inequalities.
- [Mathematics in Lean — Avigad & Massot](https://leanprover-community.github.io/mathematics_in_lean/) — [PDF](https://leanprover-community.github.io/mathematics_in_lean/mathematics_in_lean.pdf) · [repo](https://github.com/avigad/mathematics_in_lean)
  The canonical path into real Mathlib. Read interactively. Use for: sets, functions,
  algebra, and the analysis machinery once NNG is behind you.
- [Theorem Proving in Lean 4 — Avigad, de Moura, Kong, Ullrich](https://lean-lang.org/theorem_proving_in_lean4/)
  The official language reference. Consult it; don't read cover-to-cover. Use for: precise
  meaning of syntax, tactics, and term-mode proofs.
- [`teorth/analysis` companion](https://teorth.github.io/analysis/) — the project in this directory
  The actual formalization target. Each section has a Verso page, generated docs, and Lean
  source; exercises appear as `sorry`s. Use for: everything once you can write basic proofs.
- [Tao, *Analysis I* (book page)](https://terrytao.wordpress.com/books/analysis-i/)
  The primary mathematical text the companion paraphrases. Use for: the maths of record.
- [Mathlib4 documentation](https://leanprover-community.github.io/mathlib4_docs/)
  Searchable library of existing lemmas and definitions. Use for: finding the exact name of
  a result you want to use.
- [taoanalysis.wordpress.com](https://taoanalysis.wordpress.com/)
  Community discussion of specific Tao exercises (the *mathematics*, not Lean).

## Wisdom (Communities)

- [Lean Zulip — `#new-members`](https://leanprover-community.github.io/meet.html)
  Exceptionally fast and friendly; beginner questions welcome. Etiquette: use your real
  name, start a new topic per question, and post a *minimal working example* (MWE). It is
  not a "review my whole project" service. Use for: getting unstuck on Lean.

## Reference texts (NOT committed — fetched on demand)

These four trees are large and have permanent upstream homes, so they are **git-ignored**
rather than committed. On a new device, pull them down with one command:

```sh
bash scripts/fetch-sources.sh      # or scripts/setup-local.sh for fetch + auto-refresh hook
```

- [Basic Analysis I & II — Jiří Lebl](https://www.jirka.org/ra/) — [repo](https://github.com/jirilebl/ra)
  Free textbook covering undergraduate through graduate real analysis. Fetches to
  `ra-master/`. Permanent PDF: https://jirilebl.github.io/ra/realanal.pdf (Vol I) and
  https://jirilebl.github.io/ra/realanal2.pdf (Vol II).
- [Univariate Real Analysis — Martin Klazar](https://arxiv.org/abs/2508.19405)
  Lecture notes (KAM MFF UK Praha), arXiv:2508.19405. Fetches to `arXiv-2508.19405v12/`.
- [Real Analysis Notes — Noah Jussila](https://github.com/noahjussila/analysis_notes)
  Approachable notes blending Rudin, Tao, Apostol, Folland, … (MIT). Fetches to
  `analysis_notes-master/`.
- [Tao *Analysis I & II* — worked solutions — Frédéric Santos](https://github.com/frederic-santos/taoanalysissolutions)
  Solutions to the exercises (CC BY-NC-SA 4.0); canonical home
  https://gitlab.com/f-santos/taoanalysissolutions. Fetches to `taoanalysissolutions-master/`.

## Gaps

- No single resource teaches the exact path "formalize Tao's *Analysis* in Lean." We bridge
  NNG / Mathematics in Lean technique → the `teorth/analysis` companion ourselves, lesson by
  lesson. That bridge is the point of this workspace.
