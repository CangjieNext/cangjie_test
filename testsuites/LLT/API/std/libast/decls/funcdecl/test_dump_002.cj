// DEPENDENCE: %f.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*

main(): Int64 {
    let input1 = quote(
        public operator func ()(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl1 = FuncDecl(input1)

    let input2 = quote(
        public operator func !(a: Int32) : Int32 {
            return a
        }
    )
    var funcDecl2 = FuncDecl(input2)

    let input3 = quote(
        public func f<T>(a: T): Int32 where T <: I1{
            return 0
        }
    )
    var funcDecl3 = FuncDecl(input3)

    let flag1 = compareTokens(input1, quote($funcDecl1)) // libast offers compareTokens
    if (!flag1) {
        return 1
    }

    let flag2 = compareTokens(input2, quote($funcDecl2)) // libast offers compareTokens
    if (!flag2) {
        return 2
    }

    let flag3 = compareTokens(input3, quote($funcDecl3)) // libast offers compareTokens
    if (!flag3) {
        return 3
    }

    funcDecl1.dump()
    funcDecl2.dump()
    funcDecl3.dump()
    return 0
}

/* SCAN-IN
FuncDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 10: 9
    }
  }
  -modifiers: 1, Modifier {
    -keyword: Token {
      value: "operator"
      kind: OPERATOR
      pos: 10: 16
    }
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 10: 25
  }
  -identifier: Token {
    value: "()"
    kind: IDENTIFIER
    pos: 10: 30
  }
  overloadOp: ()  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 10: 33
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 10: 34
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 10: 36
      }
    }
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 10: 45
    }
  }
  -block: Block {
    -nodes: 0, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 11: 13
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 11: 20
        }
      }
    }
  }
}
FuncDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 17: 9
    }
  }
  -modifiers: 1, Modifier {
    -keyword: Token {
      value: "operator"
      kind: OPERATOR
      pos: 17: 16
    }
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 17: 25
  }
  -identifier: Token {
    value: "!"
    kind: IDENTIFIER
    pos: 17: 30
  }
overloadOp: Token {
    value: "!"
    kind: NOT
    pos: 17: 30
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 17: 32
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 17: 33
    }
    -paramType: PrimitiveType {
      -keyword: Token {
        value: "Int32"
        kind: INT32
        pos: 17: 35
      }
    }
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 17: 44
    }
  }
  -block: Block {
    -nodes: 0, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 18: 13
      }
      -expr: RefExpr {
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
          pos: 18: 20
        }
      }
    }
  }
}
FuncDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 24: 9
    }
  }
  -keyword: Token {
    value: "func"
    kind: FUNC
    pos: 24: 16
  }
  -identifier: Token {
    value: "f"
    kind: IDENTIFIER
    pos: 24: 21
  }
  -genericParam: GenericParam {
    -parameters: 0, T: Token {
      value: "T"
      kind: IDENTIFIER
      pos: 24: 23
    }
  }
  -funcParams: 0, FuncParam {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 24: 26
    }
    -colon: Token {
      value: ":"
      kind: COLON
      pos: 24: 27
    }
    -paramType: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 24: 29
      }
    }
  }
  -declType: PrimitiveType {
    -keyword: Token {
      value: "Int32"
      kind: INT32
      pos: 24: 33
    }
  }
  -genericConstraint: 0, GenericConstraint {
    -keyword: Token {
      value: "where"
      kind: WHERE
      pos: 24: 39
    }
    -typeArgument: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 24: 45
      }
    }
    -upperBound: Token {
      value: "<:"
      kind: UPPERBOUND
      pos: 24: 47
    }
    -upperBounds: 0, RefType {
      -identifier: Token {
        value: "I1"
        kind: IDENTIFIER
        pos: 24: 50
      }
    }
  }
  -block: Block {
    -nodes: 0, ReturnExpr {
      -keyword: Token {
        value: "return"
        kind: RETURN
        pos: 25: 13
      }
      -expr: LitConstExpr {
        -literal: Token {
          value: "0"
          kind: INTEGER_LITERAL
          pos: 25: 20
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
