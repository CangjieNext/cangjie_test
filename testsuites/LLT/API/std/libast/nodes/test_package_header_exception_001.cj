// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

import std.ast.*
import std.collection.*

main(): Int64 {
    var cnt = 0

    try {
        PackageHeader(quote(+?))
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    try {
        let packageHeader = PackageHeader()
        packageHeader.accessible = Token(AND)
        packageHeader.keywordM = quote(macro)[0]
        packageHeader.keywordP = Token(PACKAGE)
        packageHeader.prefixPaths = quote(prefix1 prefix2)
        packageHeader.prefixDots = quote(.)
        packageHeader.packageIdentifier = Token(IDENTIFIER, "package")
        println(packageHeader.toTokens().size)
        packageHeader.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }

    println("cnt = ${cnt}")
    return 0
}

/* SCAN-IN
Cannot construct the 'PackageHeader' node.
8
PackageHeader {
  -modifier: Token {
    value: "&&"
    kind: AND
    pos: 19: 36
  }
  -keywordM: Token {
    value: "macro"
    kind: MACRO
    pos: 20: 40
  }
  -keywordP: Token {
    value: "package"
    kind: PACKAGE
    pos: 21: 34
  }
  prefixPath: 0: Token {
    value: "prefix1"
    kind: IDENTIFIER
    pos: 22: 43
  }
  dot: 0: Token {
    value: "."
    kind: DOT
    pos: 23: 42
  }
  prefixPath: 1: Token {
    value: "prefix2"
    kind: IDENTIFIER
    pos: 22: 51
  }
  dot: 1: Token {
    value: "."
    kind: DOT
  }
  -packageIdentifier: Token {
    value: "package"
    kind: IDENTIFIER
    pos: 24: 43
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
