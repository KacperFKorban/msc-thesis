structure ppTheory :> ppTheory =
struct
  
  val _ = if !Globals.print_thy_loads
    then TextIO.print "Loading ppTheory ... "
    else ()
  
  open Type Term Thm
  local open pure_inline_cexpProofTheory in end;
  
  structure TDB = struct
    val thydata = 
      TheoryReader.load_thydata "pp"
        (holpathdb.subst_pathvars "/home/kpi/msc-thesis/ppTheory.dat")
    fun find s = HOLdict.find (thydata,s)
  end
  
  fun op OMIT_def _ = () val op OMIT_def = TDB.find "OMIT_def"
  fun op foo_def _ = () val op foo_def = TDB.find "foo_def"
  fun op foo_omit_def _ = () val op foo_omit_def = TDB.find "foo_omit_def"
  
  
val _ = if !Globals.print_thy_loads then TextIO.print "done\n" else ()
val _ = Theory.load_complete "pp"

val pp_grammars = valOf (Parse.grammarDB {thyname = "pp"})
end
