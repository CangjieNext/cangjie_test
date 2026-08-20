// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
//

internal import std.ast.*

class MyVisitor <: Visitor {
    public override func visit(curPattern: ConstPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: WildcardPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: VarOrEnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: ExceptTypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TypePattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: EnumPattern) {
        curPattern.dump()
    }

    public override func visit(curPattern: TuplePattern) {
        curPattern.dump()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        try {} catch(e: RunTime | Int64) {} finally {}
    )
    let expr = parseExpr(input)
    expr.traverse(myVisitor)

    var input1: Tokens = quote(
         match (a) {
            case a: A => b
         }
    )
    let expr1 = parseExpr(input1)
    expr1.traverse(myVisitor)

    var input2: Tokens = quote(
         match (a) {
            case (a,b) where (true) => b
         }
    )
    let expr2 = parseExpr(input2)
    expr2.traverse(myVisitor)
    return 0
}

/* SCAN-IN
ExceptTypePattern {
  -pattern: VarPattern {
    -identifier: Token {
      value: "e"
      kind: IDENTIFIER
      pos: 46: 22
    }
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 46: 23
  }
  -types: 0, RefType {
    -identifier: Token {
      value: "RunTime"
      kind: IDENTIFIER
      pos: 46: 25
    }
  }
  -types: 1, PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 46: 35
    }
  }
}
VarPattern {
  -identifier: Token {
    value: "e"
    kind: IDENTIFIER
    pos: 46: 22
  }
}
TypePattern {
  -pattern: VarPattern {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 53: 18
    }
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 53: 19
  }
  -patternType: RefType {
    -identifier: Token {
      value: "A"
      kind: IDENTIFIER
      pos: 53: 21
    }
  }
}
VarPattern {
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 53: 18
  }
}
TuplePattern {
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 61: 19
    }
  }
  -patterns: 1, VarOrEnumPattern {
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 61: 21
    }
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 61: 19
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 61: 21
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
