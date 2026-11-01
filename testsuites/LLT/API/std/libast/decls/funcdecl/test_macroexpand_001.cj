/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main() {
    let fnstr = """
    func fn(@A[1]a: collection.ArrayList<String>){

    }
"""
    let tokens = cangjieLex(fnstr)
    let decl = (parseDecl(tokens) as FuncDecl).getOrThrow()
    decl.dump()
}

/* SCAN-IN
FuncDecl {
  -keyword: Token {
    value: "func"
    kind: FUNC
  }
  -identifier: Token {
    value: "fn"
    kind: IDENTIFIER
  }
  -funcParams: 0, MacroExpandParam {
    -identifier: Token {
      value: "A"
      kind: IDENTIFIER
    }
    -macroAttrs 0: Token {
      value: "1"
      kind: INTEGER_LITERAL
    }
    -macroInputs 0: Token {
      value: "a"
      kind: IDENTIFIER
    }
    -macroInputs 1: Token {
      value: ":"
      kind: COLON
    }
    -macroInputs 2: Token {
      value: "collection"
      kind: IDENTIFIER
    }
    -macroInputs 3: Token {
      value: "."
      kind: DOT
    }
    -macroInputs 4: Token {
      value: "ArrayList"
      kind: IDENTIFIER
    }
    -macroInputs 5: Token {
      value: "<"
      kind: LT
    }
    -macroInputs 6: Token {
      value: "String"
      kind: IDENTIFIER
    }
    -macroInputs 7: Token {
      value: ">"
      kind: GT
    }
    -macroInputDecl: FuncParam {
      -identifier: Token {
        value: "a"
        kind: IDENTIFIER
      }
      -colon: Token {
        value: ":"
        kind: COLON
      }
      -paramType: QualifiedType {
        -baseType: RefType {
          -identifier: Token {
            value: "collection"
            kind: IDENTIFIER
          }
        }
        identifier: Token {
          value: "ArrayList"
          kind: IDENTIFIER
        }
        typeArguments: 0, RefType {
          -identifier: Token {
            value: "String"
            kind: IDENTIFIER
          }
        }
      }
    }
  }
  -block: Block {
  }
}
 */
