structure letpp :> letpp =
struct

open HolKernel Parse boolLib

val LET_tm = prim_mk_const {Name = "LET", Thy = "bool"}

fun strip_let tm =
  let
    fun recurse acc tm =
      let
        val (f, args) = strip_comb tm
      in
        if same_const f LET_tm andalso length args = 2 andalso
           pairSyntax.is_pabs (hd args)
        then
          let
            val (vstr, body) = pairSyntax.dest_pabs (hd args)
          in
            recurse ((vstr, hd (tl args))::acc) body
          end
        else
          (List.rev acc, tm)
      end
  in
    recurse [] tm
  end

fun letprinter (tyg, tmg) backend printer ppfns (pgr, lgr, rgr) depth tm =
  let
    open term_pp_types term_pp_utils smpp
    infix >>
    val (binds, body) = strip_let tm
    val _ = not (null binds) orelse raise UserPP_Failed
    val {add_string, ublock, add_break, ...} = ppfns:ppstream_funs
    val paren_required =
        (case rgr of
             Prec(p, _) => p > 8
           | _ => false) orelse
        (case lgr of
             Prec(_, n) => n = GrammarSpecials.fnapp_special
           | _ => false)
    fun syspr gravs t =
      printer { gravs = gravs, depth = depth - 1, binderp = false } t
    fun bpr gravs t =
      printer { gravs = gravs, depth = depth - 1, binderp = true } t
    fun prbind (vstr, rhs) =
      let
        val fvs = free_vars vstr
      in
        ublock PP.CONSISTENT 2
               (addbvs fvs >>
                bpr (Top,Top,Top) vstr >>
                add_string " " >> add_string "=" >> add_break (1,0) >>
                syspr (Top,Top,Top) rhs)
      end

  in
    getbvs >- (fn oldbvs =>
    ublock PP.CONSISTENT 0
           (add_string "let" >> add_string " " >>
            ublock PP.CONSISTENT 0
              (pr_list prbind (add_string ";" >> add_break(1,0)) binds) >>
            add_break (1, 0) >>
            add_string "in" >> add_break (1,2) >>
            syspr (pgr, Top, if paren_required then Top else rgr) body) >>
    setbvs oldbvs)
  end

val _ = temp_add_user_printer(
  "letpp",
  list_mk_comb(LET_tm, [mk_var("f", alpha --> beta), mk_var("x", alpha)]),
  letprinter);


end (* struct *)
