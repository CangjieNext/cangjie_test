/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC: %run %run_opt %output | compare %f

internal import std.ast.{ClassDecl, Annotation}

main() {
    let classDecl = ClassDecl(quote(
        @Attribute[a0, a1, a2] class A<T> where T <: Hashable {}
    ))
    classDecl.annotations.add(Annotation(quote(@!Anno)))
    classDecl.dump()
    classDecl.toTokens() |> println
    let toks = classDecl.getAttrs()
    toks.dump()
    classDecl.hasAttr("a0") |> println
    classDecl.hasAttr("a1") |> println
    classDecl.hasAttr("a2") |> println
}

<<<<<<< HEAD
// ASSERT: scan ClassDecl {
// ASSERT: scan -annotations: 0, Annotation {
// ASSERT: scan -identifier: Attribute
// ASSERT: scan -attributes: 0,     a0: Token {
// ASSERT: scan value: "a0"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -attributes: 1,     a1: Token {
// ASSERT: scan value: "a1"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -attributes: 2,     a2: Token {
// ASSERT: scan value: "a2"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -annotations: 1, Annotation {
// ASSERT: scan -identifier: Anno
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "class"
// ASSERT: scan kind: CLASS
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "A"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericParam: GenericParam {
// ASSERT: scan -parameters: 0, T: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -genericConstraint: 0, GenericConstraint {
// ASSERT: scan -keyword: Token {
// ASSERT: scan value: "where"
// ASSERT: scan kind: WHERE
// ASSERT: scan -typeArgument: RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "T"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -upperBound: Token {
// ASSERT: scan value: "<:"
// ASSERT: scan kind: UPPERBOUND
// ASSERT: scan -upperBounds: 0, RefType {
// ASSERT: scan -identifier: Token {
// ASSERT: scan value: "Hashable"
// ASSERT: scan kind: IDENTIFIER
// ASSERT: scan -body: Body {
// ASSERT: scan @Attribute[a0, a1, a2]
// ASSERT: scan @!Anno
// ASSERT: scan class A < T > where T <: Hashable {
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a0
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a1
// ASSERT: scan description: identifier, token_id: 137, token_literal_value: a2
// ASSERT: scan true
// ASSERT: scan true
// ASSERT: scan true
||||||| constructed merge base
/* SCAN
ClassDecl {
  -annotations: 0, Annotation {
    -identifier: Attribute
    -attributes: 0,     a0: Token {
      value: "a0"
      kind: IDENTIFIER
    }
    -attributes: 1,     a1: Token {
      value: "a1"
      kind: IDENTIFIER
    }
    -attributes: 2,     a2: Token {
      value: "a2"
      kind: IDENTIFIER
    }
  }
  -annotations: 1, Annotation {
    -identifier: Anno
  }
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 16: 32
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 16: 38
  }
  -genericParam: GenericParam {
    -parameters: 0, T: Token {
      value: "T"
      kind: IDENTIFIER
      pos: 16: 40
    }
  }
  -genericConstraint: 0, GenericConstraint {
    -keyword: Token {
      value: "where"
      kind: WHERE
      pos: 16: 43
    }
    -typeArgument: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 16: 49
      }
    }
    -upperBound: Token {
      value: "<:"
      kind: UPPERBOUND
      pos: 16: 51
    }
    -upperBounds: 0, RefType {
      -identifier: Token {
        value: "Hashable"
        kind: IDENTIFIER
        pos: 16: 54
      }
    }
  }
  -body: Body {
  }
}
@Attribute[a0, a1, a2]
@!Anno
class A < T > where T <: Hashable {
}

description: identifier, token_id: 137, token_literal_value: a0, fileID: 16, line: 177, column: 22
description: identifier, token_id: 137, token_literal_value: a1, fileID: 16, line: 177, column: 22
description: identifier, token_id: 137, token_literal_value: a2, fileID: 16, line: 177, column: 22
true
true
true
*/
=======
/* SCAN
ClassDecl {
  -annotations: 0, Annotation {
    -identifier: Attribute
    -attributes: 0,     a0: Token {
      value: "a0"
      kind: IDENTIFIER
    }
    -attributes: 1,     a1: Token {
      value: "a1"
      kind: IDENTIFIER
    }
    -attributes: 2,     a2: Token {
      value: "a2"
      kind: IDENTIFIER
    }
  }
  -annotations: 1, Annotation {
    -identifier: Anno
  }
  -keyword: Token {
    value: "class"
    kind: CLASS
    pos: 16: 32
  }
  -identifier: Token {
    value: "A"
    kind: IDENTIFIER
    pos: 16: 38
  }
  -genericParam: GenericParam {
    -parameters: 0, T: Token {
      value: "T"
      kind: IDENTIFIER
      pos: 16: 40
    }
  }
  -genericConstraint: 0, GenericConstraint {
    -keyword: Token {
      value: "where"
      kind: WHERE
      pos: 16: 43
    }
    -typeArgument: RefType {
      -identifier: Token {
        value: "T"
        kind: IDENTIFIER
        pos: 16: 49
      }
    }
    -upperBound: Token {
      value: "<:"
      kind: UPPERBOUND
      pos: 16: 51
    }
    -upperBounds: 0, RefType {
      -identifier: Token {
        value: "Hashable"
        kind: IDENTIFIER
        pos: 16: 54
      }
    }
  }
  -body: Body {
  }
}
@Attribute[a0, a1, a2]
@!Anno
class A < T > where T <: Hashable {
}

description: identifier, token_id: 137, token_literal_value: a0, fileID: 17, line: 177, column: 22
description: identifier, token_id: 137, token_literal_value: a1, fileID: 17, line: 177, column: 22
description: identifier, token_id: 137, token_literal_value: a2, fileID: 17, line: 177, column: 22
true
true
true
*/
>>>>>>> feat: local mode
