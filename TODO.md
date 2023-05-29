# TODOs

General:
<!-- - Expand the thesis to make it longer and more comprehensive overall. -->
<!-- - Expand Chapter 5 (Results chapter). -->
<!-- - Review and revise the final chapter to make it less "bullet point"-like and more substantial. -->

Proofs:
<!-- - Add more explanation and text to the proof in the theorem proved by induction on subst_rel. Describe the interesting cases, crucial properties, and relevant helper definitions/lemmas. -->
<!-- - Similarly, provide a more detailed explanation of the significance of Theorem 7. (deep_subst_rel t u ⇒ t =~ u) -->
<!-- - In the new implementation chapter, provide more information about the proofs. -->
<!-- - Expand the specialization explanation -->

New explanations:
<!-- - Include explanations of exp_eq and congruences for it in the Background chapter, under PureCake, ensuring it is understandable to outsiders. -->
<!-- - Provide a definition for LIST_REL in Figure 3.1. -->

Derivation trees: (revisit)
<!-- - Consider presenting the derivation tree as a bullet point list, including the steps of the proof and relevant rules used. -->

Other changes:
- Check if I can use the PureCake graphic

Used HOL definitions:
<!-- - MEM -->
<!-- - MAP2 -->
<!-- - DISJOINT -->
<!-- - LIST_REL -->


Used PureCake definitions:
<!-- - freevars -->
<!-- - boundvars -->
<!-- - closed -->
<!-- - exp_of -->
<!-- - exp_eq -->

Used PureCake definitions introduced in this project:
- freevars_of
- vars_of
- binds_ok
- no_shadowing

Feedback 2:
- Around Theorem 1, the font used in the surrounding text doesn't match the font used in the theorem. Try using \HOLtm{f} etc.
- More wrong fonts in Chapter 3.
<!-- - There seems to be typos in the derivation tree just before Section 3.3.1. The conclusion is missing parenthesis. -->
<!-- - I would have liked the first paragraph (i.e. the "chapter abstract) to be much more upfront that the specialisation pass has not been verified yet. Its verification is left as future work. -->
<!-- - I think every -- you write ought to be a --- -->
<!-- - You should add to the overrides file mappings to change names to the better, e.g. FDOM  would be more understandable as domain etc. You can do this by adding a line as follows to your overrides file. `FDOM 3 domain` -->
<!-- - similarly FLOOKUP would be nicer as lookup -->
<!-- - LIST_REL as list_rel , DISJOINT as disjoint, MEM as mem, MAP2 and map2 -->
<!-- - NONE should be None -->
<!-- - SOME should be Some -->
<!-- - in your tree derivations, the font is different from the fonts used elsewhere in the report -->
<!-- - it seems that the width is not sufficiently wide for Definition 33 -->
<!-- - Why did the author names get all caps in ref [1] and [4]? -->
<!-- - In the references you should protect names like PureCake and CakeML by writing {CakeML} and {PureCake} since otherwise they end up being Cakeml and Purecake. Same with Haskell and GCC and LLVM -->
- I wonder why all maths is in tt font. I would prefer it in sf font
<!-- - Lowercase LIST_REL etc in text and HOL subgoal snippets -->