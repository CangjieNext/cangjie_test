// DEPENDENCE: define_001.cj
// EXEC: %compiler %cmp_macro define_001.cj
// EXEC: %run_macro %compiler %cmp_opt %f | compare %f

import define.*
import std.ast.*

public class Example {
    public Example(
        @M public let a: String,
        @M public let b!: String,
        @M public let c!: String = ""
    ) {}

    public func foo(
        @M a: Int64,
        @M b!: Int64,
        @M c!: Float64 = 1.0
    ) {
    }
}

main() {
    let e1 = Example("", b: "")
    let e2 = Example("", b: "", c: "")
    0
}

/* SCAN-IN
constructor funcParam:
FuncParam {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 10: 12
    }
  }
  -keyword: Token {
    value: "let"
    kind: LET
    pos: 10: 19
  }
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 10: 23
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 10: 24
  }
  -paramType: RefType {
    -identifier: Token {
      value: "String"
      kind: IDENTIFIER
      pos: 10: 26
    }
  }
}
constructor funcParam:
FuncParam {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 11: 12
    }
  }
  -keyword: Token {
    value: "let"
    kind: LET
    pos: 11: 19
  }
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 11: 23
  }
  -not: Token {
    value: "!"
    kind: NOT
    pos: 11: 24
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 11: 25
  }
  -paramType: RefType {
    -identifier: Token {
      value: "String"
      kind: IDENTIFIER
      pos: 11: 27
    }
  }
}
constructor funcParam:
FuncParam {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 12: 12
    }
  }
  -keyword: Token {
    value: "let"
    kind: LET
    pos: 12: 19
  }
  -identifier: Token {
    value: "c"
    kind: IDENTIFIER
    pos: 12: 23
  }
  -not: Token {
    value: "!"
    kind: NOT
    pos: 12: 24
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 12: 25
  }
  -paramType: RefType {
    -identifier: Token {
      value: "String"
      kind: IDENTIFIER
      pos: 12: 27
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 12: 34
  }
  -expr: LitConstExpr {
    -literal: Token {
      value: ""
      kind: STRING_LITERAL
      pos: 12: 36
    }
  }
}
constructor funcParam:
FuncParam {
  -identifier: Token {
    value: "a"
    kind: IDENTIFIER
    pos: 16: 12
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 16: 13
  }
  -paramType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 16: 15
    }
  }
}
constructor funcParam:
FuncParam {
  -identifier: Token {
    value: "b"
    kind: IDENTIFIER
    pos: 17: 12
  }
  -not: Token {
    value: "!"
    kind: NOT
    pos: 17: 13
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 17: 14
  }
  -paramType: PrimitiveType {
    -keyword: Token {
      value: "Int64"
      kind: INT64
      pos: 17: 16
    }
  }
}
constructor funcParam:
FuncParam {
  -identifier: Token {
    value: "c"
    kind: IDENTIFIER
    pos: 18: 12
  }
  -not: Token {
    value: "!"
    kind: NOT
    pos: 18: 13
  }
  -colon: Token {
    value: ":"
    kind: COLON
    pos: 18: 14
  }
  -paramType: PrimitiveType {
    -keyword: Token {
      value: "Float64"
      kind: FLOAT64
      pos: 18: 16
    }
  }
  -assign: Token {
    value: "="
    kind: ASSIGN
    pos: 18: 24
  }
  -expr: LitConstExpr {
    -literal: Token {
      value: "1.0"
      kind: FLOAT_LITERAL
      pos: 18: 26
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
