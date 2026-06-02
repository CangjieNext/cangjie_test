// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

internal import std.ast.*

main(): Int64 {
    let opTokens = quote(
        main(){}
    )
    let opExpr = parseProgram(opTokens)
    opExpr.packageHeader.toTokens().dump()
    opExpr.packageHeader.dump()
    return 0
}

/* SCAN-IN
PackageHeader {
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
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
