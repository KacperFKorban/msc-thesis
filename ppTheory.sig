signature ppTheory =
sig
  type thm = Thm.thm
  
  (*  Definitions  *)
    val OMIT_def : thm
    val foo_def : thm
  
  (*  Theorems  *)
    val foo_omit_def : thm
  
  val pp_grammars : type_grammar.grammar * term_grammar.grammar
(*
   [pure_inline_cexpProof] Parent theory of "pp"
   
   [OMIT_def]  Definition
      
      ⊢ ∀x. OMIT x = x
   
   [foo_def]  Definition
      
      ⊢ ∀x y z. foo x y z = x + (y + (z + (x + y) + z) + x)
   
   [foo_omit_def]  Theorem
      
      ⊢ foo x y z = x + OMIT (y + (z + (x + y) + z) + x)
   
   
*)
end
