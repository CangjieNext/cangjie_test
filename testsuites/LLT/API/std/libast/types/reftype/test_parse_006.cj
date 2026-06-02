// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// EXEC: %run %run_opt %output %run_args

import std.ast.*

main() {
    let decl = FuncDecl(
        quote(func testFunc(testCfunc: CFunc<(CPointer<UInt8>, CPointer<Int64>) -> CPointer<UInt8>>) {}))
    let typ = decl.funcParams[0].paramType
    typ.dump()
}

/* SCAN-IN
RefType {
  -identifier: Token {
    value: "CFunc"
    kind: IDENTIFIER
    pos: 8: 56
  }
  -typeArguments: 0, FuncType {
    -types: 0, RefType {
      -identifier: Token {
        value: "CPointer"
        kind: IDENTIFIER
        pos: 8: 63
      }
      -typeArguments: 0, PrimitiveType {
        -keyword: Token {
          value: "UInt8"
          kind: UINT8
          pos: 8: 72
        }
      }
    }
    -types: 1, RefType {
      -identifier: Token {
        value: "CPointer"
        kind: IDENTIFIER
        pos: 8: 80
      }
      -typeArguments: 0, PrimitiveType {
        -keyword: Token {
          value: "Int64"
          kind: INT64
          pos: 8: 89
        }
      }
    }
    -ARROW: Token {
      value: "->"
      kind: ARROW
      pos: 8: 97
    }
    -returnType: RefType {
      -identifier: Token {
        value: "CPointer"
        kind: IDENTIFIER
        pos: 8: 100
      }
      -typeArguments: 0, PrimitiveType {
        -keyword: Token {
          value: "UInt8"
          kind: UINT8
          pos: 8: 109
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
