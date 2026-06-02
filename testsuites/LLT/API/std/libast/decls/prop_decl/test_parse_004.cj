// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main() {
    let input = quote(
        static mut prop i : Int64 {
            get(){println("after_get");return 0}
            set(x){println("after_set")}
        }
    )
    let decl = (parseDecl(input) as PropDecl).getOrThrow()
    let setter = parseDecl(decl.setter.toTokens(), astKind: "PropMemberDecl")
    if (!(setter is FuncDecl)) {
        return 1
    }
    let setter1 = (setter as FuncDecl).getOrThrow()
    if (setter1.block.nodes.size != 1) {
        return 2
    }
    let getter = parseDecl(decl.getter.toTokens(), astKind: "PropMemberDecl")
    if (!(getter is FuncDecl)) {
        return 3
    }
    setter.dump()
    getter.dump()
    return 0
}

/* SCAN-IN
FuncDecl {
  -identifier: Token {
    value: "set"
    kind: IDENTIFIER
    pos: 10: 13
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "x"
      kind: IDENTIFIER
      pos: 10: 17
    }
    -paramType:   }
  -block: Block {
    -nodes: 0, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "println"
          kind: IDENTIFIER
          pos: 10: 20
        }
      }
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "after_set"
            kind: STRING_LITERAL
            pos: 10: 28
          }
        }
      }
    }
  }
}
FuncDecl {
  -identifier: Token {
    value: "get"
    kind: IDENTIFIER
    pos: 9: 13
  }
  -block: Block {
    -nodes: 0, CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "println"
          kind: IDENTIFIER
          pos: 9: 19
        }
      }
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "after_get"
            kind: STRING_LITERAL
            pos: 9: 27
          }
        }
      }
    }
    -nodes: 1, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 9: 40
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 9: 47
        }
      }
    }
  }
}
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
