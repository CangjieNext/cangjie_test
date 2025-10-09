// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
main() {
    let tk = quote(features os.Mac)
    let parsed = parseProgram(tk)
    parsed.dump()
}
/* SCAN
Program {
  -featuresDirective: FeaturesDirective {
      -keyword: Token {
        value: "features"
        kind: FEATURES
        pos: 6: 20
      }
      -featureId: FeatureId {
          -identifier: Token {
            value: "os"
            kind: IDENTIFIER
            pos: 6: 29
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 6: 31
          }
          -identifier: Token {
            value: "Mac"
            kind: IDENTIFIER
            pos: 6: 32
          }
        }
    }
  -packageHeader: PackageHeader {
      -modifier: Token {
        value: "public"
        kind: PUBLIC
      }
      -keywordP: Token {
        value: "package"
        kind: PACKAGE
      }
      -packageIdentifier: Token {
        value: "default"
        kind: IDENTIFIER
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