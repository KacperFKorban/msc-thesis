structure ppLib = struct
open HolKernel Parse ppTheory

local open letpp in end

val _ = ParseExtras.tight_equality()

val _ = Parse.disable_tyabbrev_printing "word64";
val _ = Parse.disable_tyabbrev_printing "word32";
val _ = Parse.disable_tyabbrev_printing "word8";
val _ = Parse.disable_tyabbrev_printing "word4";

val _ = remove_termtok { tok = "=", term_name = "="}
val _ = add_rule {block_style = (AroundEachPhrase, (PP.CONSISTENT, 0)),
                  paren_style = OnlyIfNecessary,
                  fixity = Infix(NONASSOC, 450),
                  term_name = "=",
                  pp_elements = [HardSpace 1, TOK "=", BreakSpace(1,2)]}

val _ = remove_termtok { tok = UnicodeChars.Rightarrow, term_name = "==>"}
val _ = add_rule {block_style = (AroundEachPhrase, (PP.CONSISTENT, 0)),
                  paren_style = OnlyIfNecessary,
                  fixity = Infixr 200,
                  term_name = "==>",
                  pp_elements = [HardSpace 1, TOK UnicodeChars.Rightarrow, BreakSpace(1,2)]}

val _ = remove_termtok { tok = UnicodeChars.iff, term_name = "<=>"}
val _ = add_rule {block_style = (AroundEachPhrase, (PP.CONSISTENT, 0)),
                  paren_style = OnlyIfNecessary,
                  fixity = Infix(NONASSOC, 100),
                  term_name = "<=>",
                  pp_elements = [HardSpace 1, TOK UnicodeChars.iff, BreakSpace(1,2)]}

fun omitprinter _ _ sys _ gs d = sys {gravs=gs,depth=d,binderp=false} o fst o dest_comb
val _ = temp_add_user_printer ("omitprinter",``OMIT x``,omitprinter)

end
