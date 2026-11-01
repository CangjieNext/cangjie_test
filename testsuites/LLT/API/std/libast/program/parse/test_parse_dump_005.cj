/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// DEPENDENCE: ./test_parse_dump_005_dep.cj %n.expect
// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
//

internal import std.ast.*
internal import std.fs.*
internal import std.io.*

main() {
    let path: String = "./test_parse_dump_005_dep.cj"
    let file: File = File(path, Read)
    let reader: StringReader<File> = StringReader(file)
    let code: String = reader.readToEnd()

    let tokens: Tokens = cangjieLex(code)
    let program = parseProgram(tokens)
    program.dump()
    return 0
}

/* SCAN-IN
Program {
  -packageHeader: PackageHeader {
      -keywordP: Token {
        value: "package"
        kind: PACKAGE
      }
      -packageIdentifier: Token {
        value: "p"
        kind: IDENTIFIER
      }
    }
  -importLists: 0, ImportList {
    -modifier: Token {
      value: "internal"
      kind: INTERNAL
    }
    -keywordI: Token {
      value: "import"
      kind: IMPORT
    }
    -importKind: All
    prefixPath: 0: Token {
      value: "std"
      kind: IDENTIFIER
    }
    prefixPath: 1: Token {
      value: "ast"
      kind: IDENTIFIER
    }
    -identifier: Token {
      value: "*"
      kind: MUL
    }
  }
  -decls: 0, VarDecl {
    -keyword: Token {
      value: "var"
      kind: VAR
    }
    -identifier: Token {
      value: "global"
      kind: IDENTIFIER
    }
    -assign: Token {
      value: "="
      kind: ASSIGN
    }
    -expr: LitConstExpr {
      -literal: Token {
        value: "0"
        kind: INTEGER_LITERAL
      }
    }
  }
  -decls: 1, ClassDecl {
    -keyword: Token {
      value: "class"
      kind: CLASS
    }
    -identifier: Token {
      value: "A"
      kind: IDENTIFIER
    }
    -body: Body {
    }
  }
  -decls: 2, MainDecl {
    -keyword: Token {
      value: "main"
      kind: MAIN
    }
    -identifier: Token {
      value: "main"
      kind: IDENTIFIER
    }
    -block: Block {
      -nodes: 0, VarDecl {
        -keyword: Token {
          value: "var"
          kind: VAR
        }
        -identifier: Token {
          value: "a"
          kind: IDENTIFIER
        }
        -assign: Token {
          value: "="
          kind: ASSIGN
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "1"
            kind: INTEGER_LITERAL
          }
        }
      }
      -nodes: 1, ReturnExpr {
        -keyword: Token {
          value: "return"
          kind: RETURN
        }
        -expr: LitConstExpr {
          -literal: Token {
            value: "0"
            kind: INTEGER_LITERAL
          }
        }
      }
    }
  }
}
 */
