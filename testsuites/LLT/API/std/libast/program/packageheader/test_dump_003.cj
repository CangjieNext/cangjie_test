/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt_chir2hlir %coverage_opt %f -o %output
// EXEC: %run %run_opt %output | compare %f

internal import std.ast.*

main() {
    var cnt = 0
    try {
        let packageHeader = PackageHeader()
        packageHeader.accessible = Token(INTERNAL)
        packageHeader.keywordM = quote(macro)[0]
        packageHeader.keywordP = Token(PACKAGE)
        packageHeader.orgName = Token(IDENTIFIER, "orgA")
        packageHeader.orgSeparator = Token(DOUBLE_COLON)
        packageHeader.prefixPaths = quote(pkgA subB)
        packageHeader.prefixDots = quote(. .)
        packageHeader.packageIdentifier = Token(IDENTIFIER, "package")
        packageHeader.toTokens().dump()
        packageHeader.toTokens().toString() |> println
        println(packageHeader.toTokens().size)
        packageHeader.dump()
    } catch (e: ASTException) {
        println(e.message)
        cnt++
    }
    println("cnt = ${cnt}")
}

/* SCAN
description: macro, token_id: 88, token_literal_value: macro, fileID: 1, line: 18, column: 40
description: package, token_id: 83, token_literal_value: package, fileID: 1, line: 19, column: 34
description: identifier, token_id: 137, token_literal_value: orgA, fileID: 1, line: 20, column: 33
description: double_colon, token_id: 163, token_literal_value: ::, fileID: 1, line: 21, column: 38
description: identifier, token_id: 137, token_literal_value: pkgA, fileID: 1, line: 22, column: 43
description: dot, token_id: 0, token_literal_value: ., fileID: 1, line: 23, column: 42
description: identifier, token_id: 137, token_literal_value: subB, fileID: 1, line: 22, column: 48
description: dot, token_id: 0, token_literal_value: ., fileID: 1, line: 23, column: 44
description: identifier, token_id: 137, token_literal_value: package, fileID: 1, line: 24, column: 43
description: newline, token_id: 143, token_literal_value: \n, fileID: 1, line: 24, column: 50
macro package orgA :: pkgA.subB.package

10
PackageHeader {
  -modifier: Token {
    value: "internal"
    kind: INTERNAL
    pos: 17: 36
  }
  -keywordM: Token {
    value: "macro"
    kind: MACRO
    pos: 18: 40
  }
  -keywordP: Token {
    value: "package"
    kind: PACKAGE
    pos: 19: 34
  }
  -orgName: Token {
    value: "orgA"
    kind: IDENTIFIER
    pos: 20: 33
  }
  -orgSepartaor: Token {
    value: "::"
    kind: DOUBLE_COLON
    pos: 21: 38
  }
  prefixPath: 0: Token {
    value: "pkgA"
    kind: IDENTIFIER
    pos: 22: 43
  }
  dot: 0: Token {
    value: "."
    kind: DOT
    pos: 23: 42
  }
  prefixPath: 1: Token {
    value: "subB"
    kind: IDENTIFIER
    pos: 22: 48
  }
  dot: 1: Token {
    value: "."
    kind: DOT
    pos: 23: 44
  }
  -packageIdentifier: Token {
    value: "package"
    kind: IDENTIFIER
    pos: 24: 43
  }
}
cnt = 0
*/