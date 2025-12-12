// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*
main() {
    let tk = quote(features {os.linux,os.darwin})
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
      -featuresSet: FeaturesSet {
        -lCurl: Token {
          value: "{"
          kind: LCURL
          pos: 6: 29
        }
        -FeatureId: FeatureId {
          -identifier: Token {
            value: "os"
            kind: IDENTIFIER
            pos: 6: 30
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 6: 32
          }
          -identifier: Token {
            value: "linux"
            kind: IDENTIFIER
            pos: 6: 33
          }
        }
        -comma: : Token {
          value: ","
          kind: COMMA
          pos: 6: 38
        }
        -FeatureId: FeatureId {
          -identifier: Token {
            value: "os"
            kind: IDENTIFIER
            pos: 6: 39
          }
          -dot: Token {
            value: "."
            kind: DOT
            pos: 6: 41
          }
          -identifier: Token {
            value: "darwin"
            kind: IDENTIFIER
            pos: 6: 42
          }
        }
        -rCurl: Token {
          value: "}"
          kind: RCURL
          pos: 6: 48
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