// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

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

main(): Int64 {
    let input = quote(
        func x() {
            match (a) {
                case 1 => 1
                case (a,b) => 1
                case a : Int64 => 1
                case X => 1
                case X | Y => 1
                case Year(y) => y * 365 * 24
                case _ => 1
                case _ where (a) => 1
            }
        }
    )
    let decl = parseDecl(input)

    let myVisitor = MyVisitor()
    decl.traverse(myVisitor)

    return 0
}

/* SCAN-IN
ConstPattern {
  -litConstExpr: LitConstExpr {
    -literal: Token {
      value: "1"
      kind: INTEGER_LITERAL
      pos: 47: 22
    }
  }
}
TuplePattern {
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 48: 23
    }
  }
  -patterns: 1, VarOrEnumPattern {
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 48: 25
    }
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 48: 23
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 48: 25
  }
}
TypePattern {
  -pattern: VarPattern {
    -identifier: Token {
      value: "a"
      kind: IDENTIFIER
      pos: 49: 22
    }
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 49: 24
  }
  -patternType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 49: 26
    }
  }
}
VarPattern {
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 49: 22
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "X"
    kind: IDENTIFIER
    pos: 50: 22
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "X"
    kind: IDENTIFIER
    pos: 51: 22
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "Y"
    kind: IDENTIFIER
    pos: 51: 26
  }
}
EnumPattern {
  -constructor: RefExpr {
    -identifier: Token {
      value: "Year"
      kind: IDENTIFIER
      pos: 52: 22
    }
  }
  -patterns: 0, VarOrEnumPattern {
    -identifier: Token {
      value: "y"
      kind: IDENTIFIER
      pos: 52: 27
    }
  }
}
VarOrEnumPattern {
  -identifier: Token {
    value: "y"
    kind: IDENTIFIER
    pos: 52: 27
  }
}
WildcardPattern {
  -wildcard: Token {
    value: "_"
    kind: WILDCARD
    pos: 53: 22
  }
}
WildcardPattern {
  -wildcard: Token {
    value: "_"
    kind: WILDCARD
    pos: 54: 22
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
