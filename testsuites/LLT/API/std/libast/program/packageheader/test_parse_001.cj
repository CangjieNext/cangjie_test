// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import std.ast.*

main(): Int64 {
    let opTokens = quote(
        package default
        main(){}
    )
    let opExpr = parseProgram(opTokens)
    opExpr.packageHeader.toTokens().dump()
    opExpr.packageHeader.dump()
    return 0
}

// ASSERT: regex description: package, token_id: [0-9]+, token_literal_value: package, fileID: 1, line: 8, column: 9
// ASSERT: regex description: identifier, token_id: [0-9]+, token_literal_value: default, fileID: 1, line: 8, column: 17
// ASSERT: regex description: newline, token_id: [0-9]+, token_literal_value: \\n, fileID: 1, line: 8, column: 24
// ASSERT: regex PackageHeader {
// ASSERT: regex   -keywordP: Token {
// ASSERT: regex     value: "package"
// ASSERT: regex     kind: PACKAGE
// ASSERT: regex     pos: 8: 9
// ASSERT: regex   }
// ASSERT: regex   -packageIdentifier: Token {
// ASSERT: regex     value: "default"
// ASSERT: regex     kind: IDENTIFIER
// ASSERT: regex     pos: 8: 17
// ASSERT: regex   }
// ASSERT: regex }
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
