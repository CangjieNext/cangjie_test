// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input = quote(
        enum E {
            @API1[11]
            caseA |
            @!API2[11]
            @!API3[11]
            caseB(Int64, Bool)
        }
    )
    let enumDecl = (parseDecl(input) as EnumDecl).getOrThrow()
    if (enumDecl.constructors[1].annotations.size != 2) {
        return 1
    }
    let annos = enumDecl.constructors[1].annotations
    if (annos[0].identifier.value != "API2" || annos[1].identifier.value != "API3") {
        return 2
    }
    if (annos[0].at.kind != TokenKind.AT_EXCL || annos[1].at.kind != TokenKind.AT_EXCL) {
        return 3
    }
    enumDecl.dump()
    0
}

/* SCAN-IN
EnumDecl {
  -keyword: Token {
    value: "enum"
    kind: ENUM
    pos: 10: 9
  }
  -identifier: Token {
    value: "E"
    kind: IDENTIFIER
    pos: 10: 14
  }
  -constructors: 0, Constructor {
    -annotations: 0, Annotation {
      -identifier: API1
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "11"
            kind: INTEGER_LITERAL
            pos: 11: 19
          }
        }
      }
    }
    -identifier: Token {
      value: "caseA"
      kind: IDENTIFIER
      pos: 12: 13
    }
  }
  -constructors: 1, Constructor {
    -annotations: 0, Annotation {
      -identifier: API2
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "11"
            kind: INTEGER_LITERAL
            pos: 13: 20
          }
        }
      }
    }
    -annotations: 1, Annotation {
      -identifier: API3
      -arguments: 0, Argument {
        -expr: LitConstExpr {
          -literal: Token {
            value: "11"
            kind: INTEGER_LITERAL
            pos: 14: 20
          }
        }
      }
    }
    -identifier: Token {
      value: "caseB"
      kind: IDENTIFIER
      pos: 15: 13
    }
    -typeArguments: 0, PrimitiveType {
      -keyword: Token {
        value: "Int64"
        kind: INT64
        pos: 15: 19
      }
    }
    -typeArguments: 1, PrimitiveType {
      -keyword: Token {
        value: "Bool"
        kind: BOOLEAN
        pos: 15: 26
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
