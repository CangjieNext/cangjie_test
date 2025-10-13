// EXEC: %compiler %enableEH %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %set_stdx_path %run_opt %output %run_args 2>&1 | compare %f
internal import std.ast.*

main() : Int64 {
    let tokens = quote( perform Eff() )
    let aa = PerformExpr(tokens)
    aa.dump()
    let bb = PerformExpr()
    bb.keyword = aa.keyword
    bb.expr = aa.expr
    bb.dump()

    return 0
}

/* SCAN
PerformExpr {
  -keyword: Token {
    value: "perform"
    kind: PERFORM
    pos: 6: 25
  }
  -expr: CallExpr {
    -callFunc: RefExpr {
      -identifier: Token {
        value: "Eff"
        kind: IDENTIFIER
        pos: 6: 33
      }
    }
  }
}
PerformExpr {
  -keyword: Token {
    value: "perform"
    kind: PERFORM
    pos: 6: 25
  }
  -expr: CallExpr {
    -callFunc: RefExpr {
      -identifier: Token {
        value: "Eff"
        kind: IDENTIFIER
        pos: 6: 33
      }
    }
  }
}
*/
