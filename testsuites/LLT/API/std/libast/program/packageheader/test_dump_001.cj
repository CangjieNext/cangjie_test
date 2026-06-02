// EXEC: %compiler %cmp_opt_chir2hlir %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main() {
    let tk = quote(macro package a)
    let parsed = parseProgram(tk)
    parsed.dump()
}

/* SCAN-IN
Program {
  -packageHeader: PackageHeader {
      -keywordM: Token {
        value: "macro"
        kind: MACRO
        pos: 7: 20
      }
      -keywordP: Token {
        value: "package"
        kind: PACKAGE
        pos: 7: 26
      }
      -packageIdentifier: Token {
        value: "a"
        kind: IDENTIFIER
        pos: 7: 34
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
