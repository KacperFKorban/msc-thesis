(*
 * You can use this theory to add custom terms/definitions/theorems/etc that
 * you want to show in your report (but that are not present elsewhere).
 *)
open preamble

val _ = new_theory "pp";

(*
 * You can use OMIT to mark parts of a term that should be omitted.
 * See foo_def and foo_omit_def for an example.
 *)
val OMIT_def = Define `OMIT x = x`

val foo_def = Define `
  foo x y z = x + (y + (z + (x + y) + z) + x)
  `;

val foo_omit_def = Q.store_thm ("foo_omit_def",
  `foo x y z = x + OMIT (y + (z + (x + y) + z) + x)`,
  rw [foo_def, OMIT_def]);

val _ = export_theory ();

