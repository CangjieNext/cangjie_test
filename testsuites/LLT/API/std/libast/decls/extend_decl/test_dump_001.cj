// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.collection.*

class MyVisitor <: Visitor {
    var ident: ArrayList<String> = ArrayList<String>()
    public override func visit(curNode: FuncDecl) {
        ident.add(curNode.identifier.value)
    }

    public override func visit(curNode: RefType) {
        ident.add(curNode.identifier.value)
    }
}

let myVisitor = MyVisitor()

main(): Int64 {
    let input = quote(
        extend Foo <: I1 & I2 & I3 {
            public func f1(): Unit {}
            public func f2(): Unit {}
            public func f3(): Unit {}
        }
    )
    let decl = parseDecl(input)
    if (!(decl is ExtendDecl)) {
        return 1
    }
    let extendDecl = match (decl as ExtendDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    extendDecl.traverse(myVisitor)
    let kw = extendDecl.keyword
    if (kw.value != "extend") {
        return 2
    }
    let ty = extendDecl.extendType
    if (ty is PrimitiveType) {
        return 3
    }
    let interf = extendDecl.superTypes
    if (interf.size != 3) {
        return 4
    }
    if (interf[0] is PrimitiveType) {
        return 5
    }
    if (extendDecl.body.decls.size != 3) {
        return 6
    }
    let output = quote($extendDecl)
    let flag = compareTokens(input, output) // libast offers compareTokens
    if (!flag) {
        return 7
    }
    if (myVisitor.ident.size != 7) {
        return 8
    }
    extendDecl.extendType = RefType(quote(Bar))
    extendDecl.dump()
    return 0
}

/* SCAN-IN
ExtendDecl {
  -keyword: Token {
    value: "extend"
    kind: EXTEND
    pos: 24: 9
  }
  -extendType: RefType {
    -identifier: Token {
      value: "Bar"
      kind: IDENTIFIER
      pos: 65: 43
    }
  }
  -upperBound: Token {
    value: "<:"
    kind: UPPERBOUND
    pos: 24: 20
  }
  -superTypes: 0, RefType {
    -identifier: Token {
      value: "I1"
      kind: IDENTIFIER
      pos: 24: 23
    }
  }
  -superTypes: 1, RefType {
    -identifier: Token {
      value: "I2"
      kind: IDENTIFIER
      pos: 24: 28
    }
  }
  -superTypes: 2, RefType {
    -identifier: Token {
      value: "I3"
      kind: IDENTIFIER
      pos: 24: 33
    }
  }
  -body: Body {
    -decls: 0, FuncDecl {
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 25: 13
        }
      }
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 25: 20
      }
      -identifier: Token {
        value: "f1"
        kind: IDENTIFIER
        pos: 25: 25
      }
      -declType: PrimitiveType {
        -keyword: Token {
          value: "Unit"
          kind: UNIT
          pos: 25: 31
        }
      }
      -block: Block {
      }
    }
    -decls: 1, FuncDecl {
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 26: 13
        }
      }
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 26: 20
      }
      -identifier: Token {
        value: "f2"
        kind: IDENTIFIER
        pos: 26: 25
      }
      -declType: PrimitiveType {
        -keyword: Token {
          value: "Unit"
          kind: UNIT
          pos: 26: 31
        }
      }
      -block: Block {
      }
    }
    -decls: 2, FuncDecl {
      -modifiers: 0, Modifier {
        -keyword: Token {
          value: "public"
          kind: PUBLIC
          pos: 27: 13
        }
      }
      -keyword: Token {
        value: "func"
        kind: FUNC
        pos: 27: 20
      }
      -identifier: Token {
        value: "f3"
        kind: IDENTIFIER
        pos: 27: 25
      }
      -declType: PrimitiveType {
        -keyword: Token {
          value: "Unit"
          kind: UNIT
          pos: 27: 31
        }
      }
      -block: Block {
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
