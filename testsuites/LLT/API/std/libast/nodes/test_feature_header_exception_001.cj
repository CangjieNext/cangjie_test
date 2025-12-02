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
        let nonProduct = Annotation(quote(@NonProduct))
        featuresDirective.annotations = ArrayList<Annotation>([nonProduct])
        featuresDirective.keyword = Token(TokenKind.FEATURES)
        let featuresSet = FeaturesSet()
        let f1 = FeatureId()
        f1.identifiers = quote(os linux)
        f1.dots = quote(.)
        let f2 = FeatureId()
        f2.identifiers = quote(os darwin)
        f2.dots = quote(.)
        featuresSet.lCurl = Token(TokenKind.LCURL)
        featuresSet.content = ArrayList<FeatureId>([f1, f2])
        featuresSet.commas = quote(,)
        featuresSet.rCurl = Token(TokenKind.RCURL)
        featuresDirective.featuresSet = featuresSet
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
  -annotation: 0, Annotation {
    -identifier: NonProduct
  }
  -keyword: Token {
    value: "features"
    kind: FEATURES
    pos: 21: 37
  }
  -featuresSet: FeaturesSet {
    -lCurl: Token {
      value: "{"
      kind: LCURL
      pos: 29: 29
    }
    -FeatureId: FeatureId {
      -identifier: Token {
        value: "os"
        kind: IDENTIFIER
        pos: 24: 32
      }
      -dot: Token {
        value: "."
        kind: DOT
        pos: 25: 25
      }
      -identifier: Token {
        value: "linux"
        kind: IDENTIFIER
        pos: 24: 35
      }
    }
    -comma: : Token {
      value: ","
      kind: COMMA
      pos: 31: 36
    }
    -FeatureId: FeatureId {
      -identifier: Token {
        value: "os"
        kind: IDENTIFIER
        pos: 27: 32
      }
      -dot: Token {
        value: "."
        kind: DOT
        pos: 28: 25
      }
      -identifier: Token {
        value: "darwin"
        kind: IDENTIFIER
        pos: 27: 35
      }
    }
    -rCurl: Token {
      value: "}"
      kind: RCURL
      pos: 32: 29
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