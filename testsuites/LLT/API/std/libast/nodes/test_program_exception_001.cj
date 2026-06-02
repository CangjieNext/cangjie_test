/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        Program(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let program = Program()
        program.featuresDirective = FeaturesDirective(quote(features {os.Harmony}))
        program.packageHeader = PackageHeader(quote(package a))
        program.importLists = ArrayList<ImportList>([ImportList(quote(import b)), ImportList(quote(import c))])
        program.decls = ArrayList<Decl>([FuncDecl(quote(func d(e: f): g))])
        program.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN
Cannot construct the 'Program' node.
Program {
  -featuresDirective: FeaturesDirective {
      -keyword: Token {
        value: "features"
        kind: FEATURES
        pos: 27: 61
      }
      -featuresSet: FeaturesSet {
        -lCurl: Token {
          value: "{"
          kind: LCURL
          pos: 27: 70
        }
        -FeatureId: FeatureId {
          -identifier: Token {
            value: "os"
            kind: IDENTIFIER
            pos: 27: 71
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 27: 73
          }
          -identifier: Token {
            value: "Harmony"
            kind: IDENTIFIER
            pos: 27: 74
          }
        }
        -rCurl: Token {
          value: "}"
          kind: RCURL
          pos: 27: 81
        }
      }
    }
  -packageHeader: PackageHeader {
      -keywordP: Token {
        value: "package"
        kind: PACKAGE
        pos: 28: 53
      }
      -packageIdentifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 28: 61
      }
    }
  -importLists: 0, ImportList {
    -keywordI: Token {
      value: "import"
      kind: IMPORT
      pos: 29: 71
    }
    -importKind: Single
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 29: 78
    }
  }
  -importLists: 1, ImportList {
    -keywordI: Token {
      value: "import"
      kind: IMPORT
      pos: 29: 100
    }
    -importKind: Single
    -identifier: Token {
      value: "c"
      kind: IDENTIFIER
      pos: 29: 107
    }
  }
  -decls: 0, FuncDecl {
    -keyword: Token {
      value: "func"
      kind: FUNC
      pos: 30: 57
    }
    -identifier: Token {
      value: "d"
      kind: IDENTIFIER
      pos: 30: 62
    }
    -funcParams: 0, FuncParam {
      -identifier: Token {
        value: "e"
        kind: IDENTIFIER
        pos: 30: 64
      }
      -colon: Token {
        value: ":"
        kind: COLON
        pos: 30: 65
      }
      -paramType: RefType {
        -identifier: Token {
          value: "f"
          kind: IDENTIFIER
          pos: 30: 67
        }
      }
    }
    -declType: RefType {
      -identifier: Token {
        value: "g"
        kind: IDENTIFIER
        pos: 30: 71
      }
    }
    -block: Block {
    }
  }
}
cnt = 1
*/
