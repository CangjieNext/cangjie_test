// DEPENDENCE: %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//
internal import std.ast.*

main(): Int64 {
    let input = quote(
        public enum TimeUnit<T1> <: I1 where T1 <: A {
            Year
            | Month 
            | ...
        }
    )
    let decl = parseDecl(input)
    let enumDecl = match (decl as EnumDecl) {
        case Some(v) => v
        case None => throw Exception()
    }
    enumDecl.ellipsis.dump()
    enumDecl.dump()
    0
}

/* SCAN-IN
description: ellipsis, token_id: 49, token_literal_value: ..., fileID: 1, line: 12, column: 15
EnumDecl {
  -modifiers: 0, Modifier {
    -keyword: Token {
      value: "public"
      kind: PUBLIC
      pos: 9: 9
    }
  }
  -keyword: Token {
    value: "enum"
    kind: ENUM
    pos: 9: 16
  }
  -identifier: Token {
    value: "TimeUnit"
    kind: IDENTIFIER
    pos: 9: 21
  }
  -genericParam: GenericParam {
    -parameters: 0, T1: Token {
      value: "T1"
      kind: IDENTIFIER
      pos: 9: 30
    }
  }
  -upperBound: Token {
    value: "<:"
    kind: UPPERBOUND
    pos: 9: 34
  }
  -superTypes: 0, RefType {
    -identifier: Token {
      value: "I1"
      kind: IDENTIFIER
      pos: 9: 37
    }
  }
  -genericConstraint: 0, GenericConstraint {
    -keyword: Token {
      value: "where"
      kind: WHERE
      pos: 9: 40
    }
    -typeArgument: RefType {
      -identifier: Token {
        value: "T1"
        kind: IDENTIFIER
        pos: 9: 46
      }
    }
    -upperBound: Token {
      value: "<:"
      kind: UPPERBOUND
      pos: 9: 49
    }
    -upperBounds: 0, RefType {
      -identifier: Token {
        value: "A"
        kind: IDENTIFIER
        pos: 9: 52
      }
    }
  }
  -constructors: 0, Constructor {
    -identifier: Token {
      value: "Year"
      kind: IDENTIFIER
      pos: 10: 13
    }
  }
  -constructors: 1, Constructor {
    -identifier: Token {
      value: "Month"
      kind: IDENTIFIER
      pos: 11: 15
    }
  }
  -ellipsis: Token {
    value: "..."
    kind: ELLIPSIS
    pos: 12: 15
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
