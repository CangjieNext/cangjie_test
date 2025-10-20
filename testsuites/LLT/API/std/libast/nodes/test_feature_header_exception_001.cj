// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        FeaturesDirective(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let featuresDirective = FeaturesDirective()
        featuresDirective.keyword = Token(TokenKind.FEATURES)
        featuresDirective.commas = quote(,)
        let f1 = FeatureId()
        f1.identifiers = quote(os Mac)
        f1.dots = quote(.)
        let f2 = FeatureId()
        f2.identifiers = quote(os Linux)
        f2.dots = quote(.)
        featuresDirective.content = ArrayList<FeatureId>([f1, f2])
        featuresDirective.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}
/* SCAN
Cannot construct the 'FeaturesDirective' node.
FeaturesDirective {
  -keyword: Token {
    value: "features"
    kind: FEATURES
    pos: 19: 37
  }
  -featureId: FeatureId {
      -identifier: Token {
        value: "os"
        kind: IDENTIFIER
        pos: 22: 32
      }
      -dot: Token {
        value: "."
        kind: DOT
        pos: 23: 25
      }
      -identifier: Token {
        value: "Mac"
        kind: IDENTIFIER
        pos: 22: 35
      }
    }
    -comma: Token {
      value: ","
      kind: COMMA
      pos: 20: 42
    }
  -featureId: FeatureId {
      -identifier: Token {
        value: "os"
        kind: IDENTIFIER
        pos: 25: 32
      }
      -dot: Token {
        value: "."
        kind: DOT
        pos: 26: 25
      }
      -identifier: Token {
        value: "Linux"
        kind: IDENTIFIER
        pos: 25: 35
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