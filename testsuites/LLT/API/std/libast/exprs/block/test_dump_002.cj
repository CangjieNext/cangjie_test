// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var cnt = 0
    public override func visit(curNode: CallExpr) {
        cnt += 1
    }
    public override func visit(curNode: VarDecl) {
        breakTraverse()
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        unsafe {
            let src = acquireArrayRawData(data)
            let dst = acquireArrayRawData(ret)
            memcpy_s(CPointer<UInt8>(dst.pointer), UIntNative(8), src.pointer, UIntNative(8))
            releaseArrayRawData(src)
            releaseArrayRawData(dst)
        }
    )
    let block = parseExpr(input)
    if (!(block is Block)) {
        return 1
    }

    if ((block as Block).getOrThrow().nodes.size != 5) {
        return 2
    }
    block.traverse(myVisitor)
    if (myVisitor.cnt != 4) {
        return 3
    }

    let output = quote($block)
    let flag = compareTokens(input, output)
    if (!flag) {
        return 4
    }

    block.dump()
    return 0
}

/* SCAN-IN
Block {
  -nodes: 0, VarDecl {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 24: 13
    }
    -identifier: Token {
      value: "src"
      kind: IDENTIFIER
      pos: 24: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 24: 21
    }
    -expr: CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "acquireArrayRawData"
          kind: IDENTIFIER
          pos: 24: 23
        }
      }
      -arguments: 0, Argument {
        -expr: RefExpr {
          -identifier: Token {
            value: "data"
            kind: IDENTIFIER
            pos: 24: 43
          }
        }
      }
    }
  }
  -nodes: 1, VarDecl {
    -keyword: Token {
      value: "let"
      kind: LET
      pos: 25: 13
    }
    -identifier: Token {
      value: "dst"
      kind: IDENTIFIER
      pos: 25: 17
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
      pos: 25: 21
    }
    -expr: CallExpr {
      -callFunc: RefExpr {
        -identifier: Token {
          value: "acquireArrayRawData"
          kind: IDENTIFIER
          pos: 25: 23
        }
      }
      -arguments: 0, Argument {
        -expr: RefExpr {
          -identifier: Token {
            value: "ret"
            kind: IDENTIFIER
            pos: 25: 43
          }
        }
      }
    }
  }
  -nodes: 2, CallExpr {
    -callFunc: RefExpr {
      -identifier: Token {
        value: "memcpy_s"
        kind: IDENTIFIER
        pos: 26: 13
      }
    }
    -arguments: 0, Argument {
      -expr: CallExpr {
        -callFunc: RefExpr {
          -identifier: Token {
            value: "CPointer"
            kind: IDENTIFIER
            pos: 26: 22
          }
          typeArguments: 0, PrimitiveType {
            -keyword: Token {
              value: "UInt8"
              kind: UINT8
              pos: 26: 31
            }
          }
        }
        -arguments: 0, Argument {
          -expr: MemberAccess {
            -baseExpr: RefExpr {
              -identifier: Token {
                value: "dst"
                kind: IDENTIFIER
                pos: 26: 38
              }
            }
            -dot: Token {
              value: "."
              kind: DOT
              pos: 26: 41
            }
            -field: Token {
              value: "pointer"
              kind: IDENTIFIER
              pos: 26: 42
            }
          }
        }
      }
    }
    -arguments: 1, Argument {
      -expr: TypeConvExpr {
        -targetType: PrimitiveType {
          -keyword: Token {
            value: "UIntNative"
            kind: UINTNATIVE
            pos: 26: 52
          }
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "8"
            kind: INTEGER_LITERAL
            pos: 26: 63
          }
        }
      }
    }
    -arguments: 2, Argument {
      -expr: MemberAccess {
        -baseExpr: RefExpr {
          -identifier: Token {
            value: "src"
            kind: IDENTIFIER
            pos: 26: 67
          }
        }
        -dot: Token {
          value: "."
          kind: DOT
          pos: 26: 70
        }
        -field: Token {
          value: "pointer"
          kind: IDENTIFIER
          pos: 26: 71
        }
      }
    }
    -arguments: 3, Argument {
      -expr: TypeConvExpr {
        -targetType: PrimitiveType {
          -keyword: Token {
            value: "UIntNative"
            kind: UINTNATIVE
            pos: 26: 80
          }
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "8"
            kind: INTEGER_LITERAL
            pos: 26: 91
          }
        }
      }
    }
  }
  -nodes: 3, CallExpr {
    -callFunc: RefExpr {
      -identifier: Token {
        value: "releaseArrayRawData"
        kind: IDENTIFIER
        pos: 27: 13
      }
    }
    -arguments: 0, Argument {
      -expr: RefExpr {
        -identifier: Token {
          value: "src"
          kind: IDENTIFIER
          pos: 27: 33
        }
      }
    }
  }
  -nodes: 4, CallExpr {
    -callFunc: RefExpr {
      -identifier: Token {
        value: "releaseArrayRawData"
        kind: IDENTIFIER
        pos: 28: 13
      }
    }
    -arguments: 0, Argument {
      -expr: RefExpr {
        -identifier: Token {
          value: "dst"
          kind: IDENTIFIER
          pos: 28: 33
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
