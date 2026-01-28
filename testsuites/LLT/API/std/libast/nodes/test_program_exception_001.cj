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
        program.featuresDirective = FeaturesDirective(quote(features os.Harmony))
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

/* SCAN-IN
Cannot construct the 'Program' node.
Program {
  -featuresDirective: FeaturesDirective {
      -keyword: Token {
        value: "features"
        kind: FEATURES
        pos: 19: 61
      }
      -featureId: FeatureId {
          -identifier: Token {
            value: "os"
            kind: IDENTIFIER
            pos: 19: 70
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 19: 72
          }
          -identifier: Token {
            value: "Harmony"
            kind: IDENTIFIER
            pos: 19: 73
          }
        }
    }
  -packageHeader: PackageHeader {
      -keywordP: Token {
        value: "package"
        kind: PACKAGE
        pos: 20: 53
      }
      -packageIdentifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 20: 61
      }
    }
  -importLists: 0, ImportList {
    -keywordI: Token {
      value: "import"
      kind: IMPORT
      pos: 21: 71
    }
    -importKind: Single
    -identifier: Token {
      value: "b"
      kind: IDENTIFIER
      pos: 21: 78
    }
  }
  -importLists: 1, ImportList {
    -keywordI: Token {
      value: "import"
      kind: IMPORT
      pos: 21: 100
    }
    -importKind: Single
    -identifier: Token {
      value: "c"
      kind: IDENTIFIER
      pos: 21: 107
    }
  }
  -decls: 0, FuncDecl {
    -keyword: Token {
      value: "func"
      kind: FUNC
      pos: 22: 57
    }
    -identifier: Token {
      value: "d"
      kind: IDENTIFIER
      pos: 22: 62
    }
    -funcParams: 0, FuncParam {
      -identifier: Token {
        value: "e"
        kind: IDENTIFIER
        pos: 22: 64
      }
      -colon: Token {
        value: ":"
        kind: COLON
        pos: 22: 65
      }
      -paramType: RefType {
        -identifier: Token {
          value: "f"
          kind: IDENTIFIER
          pos: 22: 67
        }
      }
    }
    -declType: RefType {
      -identifier: Token {
        value: "g"
        kind: IDENTIFIER
        pos: 22: 71
      }
    }
    -block: Block {
    }
  }
}
cnt = 1
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
