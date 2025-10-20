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

main() {
    let tk = quote(
        macro package ORGA::pkgA.subB.pkg
    )
    let parsed = parseProgram(tk)
    let header = parsed.packageHeader
    header.dump()
}
/* SCAN
PackageHeader {
  -keywordM: Token {
    value: "macro"
    kind: MACRO
    pos: 15: 9
  }
  -keywordP: Token {
    value: "package"
    kind: PACKAGE
    pos: 15: 15
  }
  -orgName: Token {
    value: "ORGA"
    kind: IDENTIFIER
    pos: 15: 23
  }
  -orgSepartaor: Token {
    value: "::"
    kind: DOUBLE_COLON
    pos: 15: 27
  }
  prefixPath: 1: Token {
    value: "pkgA"
    kind: IDENTIFIER
    pos: 15: 29
  }
  dot: 1: Token {
    value: "."
    kind: DOT
    pos: 15: 33
  }
  prefixPath: 2: Token {
    value: "subB"
    kind: IDENTIFIER
    pos: 15: 34
  }
  dot: 2: Token {
    value: "."
    kind: DOT
    pos: 15: 38
  }
  -packageIdentifier: Token {
    value: "pkg"
    kind: IDENTIFIER
    pos: 15: 39
  }
}
*/