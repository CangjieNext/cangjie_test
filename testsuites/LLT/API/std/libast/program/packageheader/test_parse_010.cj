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
    let header = PackageHeader(tk)
    header.toTokens().toString() |> println
    header.orgName.dump()
    header.orgSeparator.dump()
    header.dump()
}
/* SCAN
macro package ORGA :: pkgA.subB.pkg

description: identifier, token_id: 137, token_literal_value: ORGA, fileID: 1, line: 15, column: 23
description: double_colon, token_id: 163, token_literal_value: ::, fileID: 1, line: 15, column: 27
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
  prefixPath: 0: Token {
    value: "pkgA"
    kind: IDENTIFIER
    pos: 15: 29
  }
  dot: 0: Token {
    value: "."
    kind: DOT
    pos: 15: 33
  }
  prefixPath: 1: Token {
    value: "subB"
    kind: IDENTIFIER
    pos: 15: 34
  }
  dot: 1: Token {
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